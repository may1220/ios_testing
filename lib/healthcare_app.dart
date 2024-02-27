import 'dart:io';

import 'package:ebhc/data_models/firebase_auth_repository.dart';
import 'package:ebhc/data_models/firebase_fcm_provider.dart';
import 'package:ebhc/data_models/share_pref_provider.dart';
import 'package:ebhc/views/base_page.dart';
import 'package:ebhc/views/pages/admin/admin_worker_information_detail.dart';
import 'package:ebhc/views/pages/admin/worker_information_list_page.dart';
import 'package:ebhc/views/pages/alert_detail_page.dart';
import 'package:ebhc/views/pages/forget_pw_page.dart';
import 'package:ebhc/views/pages/login_page.dart';
import 'package:ebhc/views/pages/map_page.dart';
import 'package:ebhc/views/pages/new_design/graph_1.dart';
import 'package:ebhc/views/pages/settings_page.dart';
import 'package:ebhc/views/pages/test_feature_page.dart';
import 'package:ebhc/views/pages/qrscan_page.dart';
import 'package:ebhc/views/pages/user/group_selection_page.dart';
import 'package:ebhc/views/pages/user/worker_information_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ebhc/views/pages/alert_manager_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

// namedrouteはtypoの問題があるので、
// 定義側はしょうがないとして、
// 使用する際にはconstクラス変数で指定すべき
// クラス内に入れるべきかも？
class RouteNames {
  static const String alertManagerPage = '/alerts';
  static const String statsPage = '/stats';
}

// 本来は全部LoginPageにすべきだが、とりあえずin/outどちらでも同一とする
final loggedOutRouteMap = RouteMap(
  onUnknownRoute: (_) => const Redirect('/'),
  routes: {
    '/': (_) => MaterialPage(child: LoginPage()),
  },
);

final loggedInRouteMap = RouteMap(
  onUnknownRoute: (_) => const Redirect('/'),
  routes: {
    '/': (_) => const MaterialPage(child: BasePage()),
    // alerts
    '/alerts': (_) => const MaterialPage(child: AlertManagerPage()),
    '/alerts/:alertId': (route) => MaterialPage(child: AlertDetailPage(route.pathParameters['alertId'] ?? "")),
    // settings
    '/settings': (_) => const MaterialPage(child: SettingsPage()),

    // feature test
    '/settings/tests': (_) => const MaterialPage(child: TestFeaturePage()),
    '/settings/tests/map': (_) => const MaterialPage(child: MapPage()),
    '/settings/tests/graph': (_) => const MaterialPage(child: Graph1Page()),
    '/settings/tests/qrscan': (_) => const MaterialPage(child: QrScanPage()),
    '/worker_detail': (_) => const MaterialPage(child: WorkerInformationPage()),
    '/admin_detail': (_) => const MaterialPage(child: AdminWorkerInformationPage()),
    '/forget_pw': (_) => MaterialPage(child: ForgetPasswordPage()),
    '/all_group_list': (_) => const MaterialPage(child: GroupSelectionPage()),
    '/user_group_list': (_) => const MaterialPage(child: WorkerInformationListPage()),
  },
);

// forgetpw
class HealthcareApp extends HookConsumerWidget {
  const HealthcareApp({Key? key}) : super(key: key);

  // user changedについてのstreamはこのタイミングで取れる？
  // うまく扱えない
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print("top level building");
    }
    // signinしていない状態で起動した場合に２回buildが走っているようだ
    // streamが取れる前のloadingでvalue評価null→最初のdataがnullということ？
    // login中の状態で起動した場合はnull→user
    final user = ref.watch(firebaseAuthUserIdStreamProvider).value;
    if (kDebugMode) {
      print("■■■ user: $user");
    }
    final fcmsp = ref.watch(fcmStateProvider.notifier);
    if (fcmsp != null) {
      fcmsp.initToken();
    }
    final isFirstLaunch = ref.watch(isFirstLaunchProvider).maybeWhen(
          data: (value) => value,
          orElse: () => false,
        );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) {
          //return tmpRouteMap2;
          if (kDebugMode) {
            print("■■■ -- routeBuilder -- user: $user");
          }
          if (isFirstLaunch) {
            if (Platform.isIOS) {
              FirebaseAuth.instance.signOut();
            }
            return loggedOutRouteMap;
          } else {
            return user != null ? loggedInRouteMap : loggedOutRouteMap;
          }
        },
        observers: [EbhcObserver()],
      ),
      routeInformationParser: const RoutemasterParser(),
      title: 'Healthcare App',
      theme: ThemeData(
        //swatchはMaterialColorである必要がある
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2F24E6),
        // Noto Sans Japaneseがないのでとりあえず
        textTheme: GoogleFonts.bizUDPGothicTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}

/// Log the route history to crashlytic
class EbhcObserver extends RoutemasterObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    //FirebaseCrashlytics.instance.log('EBHC ROUTE (back): ${previousRoute.toString()}');
  }

  @override
  void didChangeRoute(RouteData routeData, Page page) {
    FirebaseCrashlytics.instance.log(
        'ROUTE: [${DateTime.now().millisecondsSinceEpoch}] ${routeData.fullPath}');
  }
}
