import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebhc/data_models/alert_manage_state_provider.dart';
import 'package:ebhc/data_models/firebase_fcm_provider.dart';
import 'package:ebhc/data_models/health_state.dart';
import 'package:ebhc/data_models/health_state_provider.dart';
import 'package:ebhc/data_models/user_state_provider.dart';
import 'package:ebhc/data_models/working_state_provider.dart';
import 'package:ebhc/views/pages/dialog.dart';
import 'package:ebhc/views/pages/health_status_display.dart';
import 'package:ebhc/views/pages/new_design/custom_weather_panel.dart';
import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/pages/new_design/work_control_button_widget.dart';
import 'package:ebhc/views/widget/app_bar.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class EasyDashboardHomePage extends HookConsumerWidget {
  const EasyDashboardHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void>? dialogFuture = null;

    print("######### EASY DASHBOARD HOME PAGE  ###########");
    final fcmsp = ref.watch(fcmStateProvider.notifier);
    if (fcmsp != null) {
      fcmsp.initToken();
      fcmsp.changeRouteAfterOnClick(context);
    }

    if (kDebugMode) {
      print("dashboard building");
    }
    return
        // こちらは到着時
        // FCMNotificationClickListener はtap時に通知を受け取る
        FCMNotificationListener(
            onNotification: (RemoteMessage remoteMessage, _) async {
              if (kDebugMode) {
                print("❗❗❗!!! call onNotification !!!");
              }
              // ここまでは届いている
              final data = remoteMessage.data;
              final body = remoteMessage.notification!.body;
              final alertId = data["docId"] as String;
              if (kDebugMode) {
                print("initial msssage is available: $alertId");
              }
              //
              if (dialogFuture != null) {
                if (kDebugMode) {
                  print("dialog is already opened");
                }
              } else {
                final userState = ref.watch(userStateProvider).value;
                final isLeader =
                    (userState != null) ? userState.isLeader : false;

                final routemaster = Routemaster.of(context);
                dialogFuture = dialog(context, body, data);
                await dialogFuture;
                // 閉じて戻った後の遷移
                // 'openedApplication': 'false' はひとまず保留
                final alertManageStateNotifier =
                    ref.watch(alertManageStateNotifierProvider.notifier);
                alertManageStateNotifier.setGroupMode(isGroupMode: false);
                if (isLeader == true) {
                  routemaster.push("/alerts/$alertId");
                } else {
                  routemaster.push("/");
                }
                dialogFuture = null;
              }
            },
            child: _DashboardWidget());
  }
}

class _DashboardWidget extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final ws = ref.watch(workingStateNotifierProvider);
    final wsp = ref.watch(workingStateNotifierProvider.notifier);
    // valueで取り出し: Loadingはnull, errorはerror raise
    final currentHealth = ref.watch(currentHealthStreamProvider).value;
    final userState = ref.watch(userStateProvider).value;
    if (userState == null) {
      if (kDebugMode) {
        print("empty siteName");
      }
    }
    //final siteId = (userState != null) ? userState.siteId : "";

    final isLeader = (userState != null) ? userState.isLeader : false;
    final workingStatus = (userState != null) ? userState.workingStatus : "";
    final heatStrokeLevel =
        (currentHealth != null) ? currentHealth.heatstrokeLevel : null;
    // final label = getHeatStrokeLabel(heatStrokeLevel);
    final healthLevel =
        (currentHealth != null) ? currentHealth.healthLevel : null;
    final healthUpdateTime = (currentHealth != null) ? currentHealth.time : "";

    // この辺りはUI側に置くべきものではない
    //final heartRate = (currentHealth != null) ? currentHealth.heartRate : -1;
    //ref.watch(heartRateProvider.notifier).update(heartRate);

    final isStartWorkingButton = (workingStatus == "stopped");
    final isStopWorkingButton = (workingStatus == "started");
    Widget startWorking() {
      return isLeader
          ? const SizedBox()
          : WorkControlButtonWidget(
              isStartWorkingButton: isStartWorkingButton,
              isStopWorkingButton: isStopWorkingButton,
              onPressed: () {
                if (kDebugMode) {
                  print("■ onPressed !!");
                }
                wsp.toggle(workingStatus);
              });
    }

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBarWidget(
        appBar: AppBar(),
        isLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          startWorking(),
          /*    Container(
            height: 45,
            color: Colors.red,
            child: GestureDetector(
              onTap: () {
                List<Map<String, dynamic>> dataList = [
                  {"time": "00", "heartrate": 80},
                  {"time": "10", "heartrate": 88},
                  {"time": "20", "heartrate": 70},
                  {"time": "30", "heartrate": 60},
                  {"time": "40", "heartrate": 100},
                ];

                for (var i = 0; i < dataList.length; i++) {
                  final hSCollectionReferenc =
                      FirebaseFirestore.instance.collection('health_status');
                  final hSdocumentReference = hSCollectionReferenc.doc();
                  String docId = hSdocumentReference.id;

                  // Stream.periodic(const Duration(minutes: 3), (timer) async {
                  //To do List
                  //To display double data in the user interface
                  HealthState currentHealthState = HealthState(
                      // docId: docId,
                      uName: "D8846CU04640U",
                      sName: "5C:75:AF:5F:A6:ED",
                      time: "2023-07-21 08:${dataList[i]['time']}:00",
                      heartRate: dataList[i]['heartrate'],
                      healthLevel: 1,
                      heatstrokeLevel: 1,
                      templerature: 18.0,
                      ralativeHumidity: 20.0,
                      wbgt: 30.0);
                  Map<String, dynamic> hs = currentHealthState.toJson();
                  hs['uId'] = '${FirebaseAuth.instance.currentUser?.uid}';
                  hs['docId'] = docId;

                  hSdocumentReference.set(hs);
                }
              },
              child: Text("Data Adding"),
            ),
          ),
 */
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HealthPanelWidget(
                    isLeader: isLeader,
                    healthLevel: healthLevel,
                    heatStrokeLevel: heatStrokeLevel,
                    healthUpdateTime: healthUpdateTime,
                  ),
                  const Divider(
                    thickness: 10,
                    color: Colors.black,
                  ),
                  const CustomWeatherPanel()
                  // WeatherPanel(
                  //   siteId: siteId,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
