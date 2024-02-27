import 'package:ebhc/data_models/alert_manage_state_provider.dart';
import 'package:ebhc/data_models/alert_state.dart';
import 'package:ebhc/data_models/alert_state_provider.dart';
import 'package:ebhc/data_models/firebase_auth_repository.dart';
import 'package:ebhc/data_models/map_state_provider.dart';
import 'package:ebhc/data_models/user_state_provider.dart';
import 'package:ebhc/utils/app_constants.dart';
import 'package:ebhc/views/pages/alert_display.dart';
import 'package:ebhc/views/widget/app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// alert詳細は/users/{uid}/alert/{alertId}から取って表示する
// FCMのmessageについてはalertIdしか参照しないことにし、messageStoreは使わない
// push通知の表示上はmessageIdでmessage識別するが内部的にはrandom生成のalertIdとする

class AlertDetailPage extends HookConsumerWidget {
  const AlertDetailPage(this.alertId, {Key? key}) : super(key: key);
  final String alertId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alertManageState = ref.watch(alertManageStateNotifierProvider);
    final isGroupAlert = alertManageState.isGroupAlert;
    final userState = ref.watch(userStateProvider).value;
    late String? id;
    final isLeader = (userState != null) ? userState.isLeader : false;
    // if isLeader is true, extract document from users collection
    // if isLeader is false, extract document from group collection
    if (isLeader) {
      id = userState.gId;
    } else {
      id = ref.watch(firebaseAuthUserIdProvider).value;
    }
    if (id == null) {
      return Scaffold(
          appBar:
              AppBarWidget(title: "アラート詳細", isLeading: true, appBar: AppBar()),
          body: Center(child: Text("アラート対象idが不適合です: alertId: \"$alertId\"")));
    }
    final asyncAlertState = ref.watch(alertStateProvider(
        AlertStateProviderParameters(
            id: id, alertId: alertId, isGroupAlert: isLeader)));
    return asyncAlertState.when(
      data: ((data) {
//        final showMap = isGroupAlert;
        const showMap = true;
        return _createWidgetDummy(context, data!, showMap);
      }),
      error: (error, stackTrace) {
        if (kDebugMode) {
          print("$error: $stackTrace");
        }
        return Scaffold(
            appBar: AppBarWidget(
                title: "アラート詳細", isLeading: true, appBar: AppBar()),
            body: Center(child: Text("アラート情報が存在しません: alertId: \"$alertId\"")));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  //final alert = await getAlert(alertId);

  Widget _createWidgetDummy(
      BuildContext context, AlertState alertState, bool showMap) {
    final double latitude = alertState.latitude;
    final double longitude = alertState.longitude;

    // const double latitude = 35.66479091421024;
    // const double longitude = 139.73957332878268;

    if (kDebugMode) {
      print("show alert detail: $alertId");
    }
    final alertType = alertState.type;
    final alertName = AlertDisplay.getAlertName(alertType);
    return Scaffold(
      appBar: AppBarWidget(
        title: "アラート詳細",
        isLeading: true,
        appBar: AppBar(),
        icon: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            AlertTypeNotificationPanel(alertMessage: "$alertName のアラートが発生しました"),
            const SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    row('アラート種別', "$alertName [$alertType]"),
                    row('発生日時', alertState.time),
                    row('メッセージID', alertState.messageId.toString()),
                    // row('アラートID', alertState.docId),
                    row('latitude', alertState.latitude.toString()),
                    row('longitude', alertState.longitude.toString()),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            (showMap &&
                    (alertState.latitude != AppConstants.latitude &&
                        alertState.longitude != AppConstants.longitude))
                ? MapWidget(
                    latitude: latitude,
                    longitude: longitude,
                    markerName: "発生位置")
                : const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('位置情報の取得に失敗しました',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
          ],
        ),
      ),
    );
  }

  Widget row(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$title:', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}

// getAlert(String alertId): Future<> {
// }

class MyElevatedButton extends HookConsumerWidget {
  final Color color;

  final void Function()? onPressed;

  final String text;

  const MyElevatedButton(
      {Key? key, required this.color, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 16,
      ),
      child: Text(text),
    );
  }
}

class MapWidget extends HookConsumerWidget {
  const MapWidget(
      {required this.latitude,
      required this.longitude,
      required this.markerName,
      Key? key})
      : super(key: key);
  final double latitude;
  final double longitude;
  final String markerName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mmsp = ref.watch(mapStateProvider.notifier);

    useEffect(() {
      mmsp.initState();
      //mmsp.setPosition(latitude: latitude, longitude: longitude);
      return () {};
    }, []);

    return SizedBox(
      width: double.infinity,
      height: 400,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            //CameraPosition(target: mmState.lastPosition, zoom: 18),
            CameraPosition(target: LatLng(latitude, longitude), zoom: 18),
        onMapCreated: mmsp.onMapCreated,
        myLocationEnabled: true,
        compassEnabled: true,
        markers: //mmState.markers,
            {
          Marker(
              markerId: MarkerId(markerName),
              position: LatLng(latitude, longitude)),
        },
        onCameraMove: mmsp.onCameraMove,
      ),
    );
  }
}

///////////
// TODO: カードの内側にpadding等が必要
class AlertTypeNotificationPanel extends HookConsumerWidget {
  final String alertMessage;

  const AlertTypeNotificationPanel({required this.alertMessage, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 328,
      //
      child: Card(
        // TODO: boxShadowをshadowColor&elevationでごまかしでokか？
        //   boxShadow: const [
        //     BoxShadow(
        //       color: Color(0x26131416),
        //       blurRadius: 20,
        //       offset: Offset(0, 10),
        //     ),
        //     BoxShadow(
        //       color: Color(0x19131416),
        //       blurRadius: 6,
        //       offset: Offset(0, 3),
        //     ),
        //   ],
        elevation: 4,
        shadowColor: const Color(0x19131416),
        //
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: Color(0xffd50000),
          ),
        ),
        color: const Color(0xfffdecec),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: このあたり構造を最適化できそうではある
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(Icons.error,
                              color: Color(0xffd50000), size: 20),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            alertMessage,
                            style: const TextStyle(
                              color: Color(0xff2b0000),
                              fontSize: 16,
                              fontFamily: "Noto Sans JP",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 本文領域
          ],
        ),
      ),
    );
  }
}
