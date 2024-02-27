// ConsumerWidgetでProviderから値を受け渡す
import 'package:ebhc/data_models/alert_manage_state_provider.dart';
import 'package:ebhc/data_models/firebase_firestore_group_alerts_stream_provider.dart';
import 'package:ebhc/data_models/firebase_firestore_user_alerts_stream_provider.dart';
import 'package:ebhc/data_models/user_state_provider.dart';
import 'package:ebhc/views/pages/alert_display.dart';
import 'package:ebhc/views/widget/app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class AlertManagerPage extends HookConsumerWidget {
  const AlertManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routemaster = Routemaster.of(context);
    final alertManageState = ref.watch(alertManageStateNotifierProvider);
    final isGroupAlert = alertManageState.isGroupAlert;
    // Providerから値を受け取る
//    final asyncValue = ref.watch(firebaseAuthUserIdProvider);
    final asyncAlerts = ref.watch(
        (isGroupAlert) ? groupAlertsStreamProvider : userAlertsStreamProvider);
    return Scaffold(
      appBar: AppBarWidget(
        title: isGroupAlert ? 'グループアラート一覧' : 'アラート一覧',
        appBar: AppBar(),
        isLeading: true,
        icon: false,
      ),
      body: asyncAlerts.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (alerts) => Column(
          children: [
            Expanded(
              // StreamProviderから受け取った値は .when() で状態に応じて出し分けできる
              child: ListView(
                children: alerts.map<Widget>((alert) {
                  return AlertCard(
                      Map<String, dynamic>.from(alert), ref, routemaster);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Future<void> _doSignout() async {
//   await FirebaseAuth.instance.signOut();
// }

// Future<void> _deleteDoc(id) async {
//   // 投稿メッセージのドキュメントを削除
//   await FirebaseFirestore.instance.collection('posts').doc(id).delete();
// }

class AlertCard extends Card {
  const AlertCard(this.doc, this.ref, this.routemaster, {Key? key})
      : super(key: key);
  final WidgetRef ref;
  final Map<String, dynamic> doc;
  final Routemaster routemaster;

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userStateProvider).value;
    if (userState == null) {
      return const Card(child: Text("エラー"));
    }
    final alertType = doc["type"];
    final color = AlertDisplay.getAlertColor(alertType);
    final alertName = AlertDisplay.getAlertName(alertType);
    final alertUId = doc["uId"];
    final userName =
        (userState.uId == alertUId) ? userState.name : "メンバー($alertUId)";
    final messageId = doc['messageId'];
    final alertId = doc['docId'];
    final alertDateTime = doc['time'];

    return Card(
      child: InkWell(
        onTap: () {
          if (kDebugMode) {
            print('Tapped');
          }
          final alertId = doc['docId'];
          if (alertId != null) {
            // opendApplication: false はとりあえず保留
            routemaster.push(alertId);
            if (kDebugMode) {
              print("route to $alertId");
            }
          }
        },
        child: ListTile(
          isThreeLine: true,
          leading: Icon(Icons.notification_important, color: color),
          title: Text("$alertName [$alertType]: $userName"),
          subtitle: Text(" アラート番号 $messageId\n発生日時 $alertDateTime"),
          // subtitle: Text(doc['uId']),
          // trailing: doc['uId'] == userId
          //     ? IconButton(
          //         icon: const Icon(Icons.delete),
          //         onPressed: () {
          //           _deleteDoc(doc.id);
          //         },
          //       )
          //     : null,
        ),
      ),
    );
  }
}
