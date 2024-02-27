import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebhc/data_models/location_address/alert_update.dart';
import 'package:ebhc/data_models/user_state.dart';
import 'package:ebhc/main.dart';
import 'package:ebhc/views/pages/new_design/custom_weather_panel.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'package:ebhc/views/easy_dashboard_home_page.dart';

class BasePage extends HookConsumerWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final settings = ref.watch(settingsStateProvider);

    // ターミネイト状態でプッシュ通知メッセージからアプリを起動した場合
    // うまく効いていない？
    useEffect(() {
      /* Future.microtask(() => */ FCMConfig.instance
          .getInitialMessage() /* ) */
          .then((message) async {
        if (kDebugMode) {
          print("■■■■■ got initial message ■■■■■");
        }
        if (message != null &&
            message.messageId != null &&
            message.messageId != "") {
          final alertId = message.data["docId"];
          if (kDebugMode) {
            print("initial msssage is available: $alertId");
          }
          // 'openedApplication': 'true' はひとまず保留
          final routemaster = Routemaster.of(context);
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            final userStateDoc = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
            UserState userState = UserState.fromJson(userStateDoc.data()!);

            final isLeader = (userState != null) ? userState.isLeader : false;
            if (isLeader == true) {
              routemaster.push("/alerts/$alertId");
            } else {
              routemaster.push("/");
            }
          } else {
            routemaster.push("/");
          }

        }
      });
      return () {};
    }, const []);

    final alertStreamProviderValue = ref.watch(alertStreamProvider(FirebaseAuth.instance.currentUser!.uid));
    /// FG BF changes listener
    return FGBGNotifier(
        onEvent: (FGBGType event) {
          debugPrint('■■ ■■ ■■ ■■ bg/fb => ${event.name}');
          if(event == FGBGType.foreground){
            saveToLocationCollection(interrupt: true);
            customHourlyWeatherWidget(ref);
          }
        },
        child: const EasyDashboardHomePage() // const WorkerInformationListPage();
    );
  }
}
