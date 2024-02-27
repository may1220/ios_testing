//import 'package:ebhc/components/fcm_notification_listener.dart';
import 'package:ebhc/data_models/firebase_auth_repository.dart';
import 'package:ebhc/data_models/firebase_fcm_provider.dart';
import 'package:ebhc/data_models/firebase_firestore_provider.dart';
import 'package:ebhc/data_models/health_state_provider.dart';
import 'package:ebhc/data_models/user_state_provider.dart';
import 'package:ebhc/data_models/working_state_provider.dart';
import 'package:ebhc/views/pages/new_design/custom_weather_panel.dart';
import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../data_models/heart_rate_state_provider.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStateAsyncValue = ref.watch(userStateProvider);
    final routemaster = Routemaster.of(context);
    if (kDebugMode) {
      print("settings building");
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定確認・変更"),
        backgroundColor: AppColors.bgBtnColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              if (kDebugMode) {
                print("signout");
              }
              // TODO: 全体でトランザクションでないといけない

              final fcmsp = ref.watch(fcmStateProvider.notifier);
              await fcmsp.setToken("");

              await ref.read(firebaseAuthProvider).signOut();
              if (kDebugMode) {
                print("signout done");
              }
              ref.read(hourlyNotifierProvider.notifier).resetState();
              ref.read(dailyNotifierProvider.notifier).resetState();
              ref.invalidate(heartRateStateProvider);
              ref.invalidate(currentHealthStreamProvider);
              ref.invalidate(workingStateNotifierProvider);
              await routemaster.popUntil(
                  //(_) => true
                  (routeData) => routeData.path != "/");
              if (kDebugMode) {
                print("route to /");
              }
            },
          )
        ],
      ),
      body: Column(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: userStateAsyncValue.when(data: (data) {
                if (kDebugMode) {
                  print("when data");
                }
                final uId = data!.uId;
                if (kDebugMode) {
                  if (uId.isEmpty) {
                    print("uid is empty");
                  }
                }
                final userNameController = useTextEditingController(
                  text: data.name,
                );

                return <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: '作業者名',
                        hintText: '作業者名を入れてください',
                      ),
                      onSubmitted: (name) async {
                        if (kDebugMode) {
                          print("change name: $name");
                        }
                        await updateUserName(uId, name);
                      },
                      controller: userNameController,
                    ),
                  ),
                ];
              }, loading: () {
                if (kDebugMode) {
                  print("when loading");
                }
                return [const Text("読込中")];
              }, error: (e, stackTrace) {
                if (kDebugMode) {
                  print("when error");
                }
                return [Text(e.toString())];
              })),
          /*   ElevatedButton(
            onPressed: () {
              if (kDebugMode) {
                print("settings->tests");
              }
              Routemaster.of(context).push("tests");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              elevation: 16,
            ),
            child: Text("機能テスト"),
          ), */
        ],
      ),
    );
  }

  // Widget row(String title, String value) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 8),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text('$title:', style: const TextStyle(fontWeight: FontWeight.bold)),
  //         Text(value),
  //       ],
  //     ),
  //   );
  // }
}

// class _MyElevatedButton extends HookConsumerWidget {
//   final Color color;
//   final String text;
//   final Function()? onPressed;

//   const _MyElevatedButton(this.color, this.text, {this.onPressed, Key? key})
//       : super(key: key);
//   //onPressed ??= () {};

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         primary: color,
//         elevation: 16,
//       ),
//       child: Text(text),
//     );
//   }
// }
