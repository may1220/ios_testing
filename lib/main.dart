import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:background_fetch/background_fetch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebhc/location/location_tracker.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ebhc/healthcare_app.dart';
import 'package:ebhc/firebase_options_staging.dart' as firebase_options_for_staging;
import 'package:ebhc/firebase_options_development.dart' as firebase_options_for_development;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

const buildFlavorProduction = "production";
const buildFlavorStaging = "staging";
const buildFlavorDevelopment = "development";

const buildFlavor = String.fromEnvironment('BUILD_FLAVOR',
    defaultValue: buildFlavorDevelopment);

// Toggle this to cause an async error to be thrown during initialization
// and to test that runZonedGuarded() catches the error
const _kShouldTestAsyncErrorOnInit = false;

// Toggle this for testing Crashlytics in your app locally.
const _kTestingCrashlytics = true;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

FirebaseOptions getDefaultFirebaseOptions() {
  print("Build Flavor ******************** $buildFlavor");
  switch (buildFlavor) {
    //  case buildFlavorProduction:
    //   if (kDebugMode) {
    //     print("selected production firebase_options");
    //   }
    //   return firebase_options_for_production
    //       .DefaultFirebaseOptions.currentPlatform;
    case buildFlavorStaging:
      if (kDebugMode) {
        print("selected staging firebase_options");
      }
      return firebase_options_for_staging
          .DefaultFirebaseOptions.currentPlatform;
    case buildFlavorDevelopment:
      if (kDebugMode) {
        print("selected development firebase_options");
      }
      return firebase_options_for_development
          .DefaultFirebaseOptions.currentPlatform;
    default:
      throw ArgumentError('Not available build flavor');
  }
}

late Future<void> _initializeFlutterFireFuture;
late LocationStream timerStream;

Future<void> _testAsyncErrorOnInit() async {
  Future<void>.delayed(const Duration(seconds: 2), () {
    final List<int> list = <int>[];
    print(list[100]);
  });
}

// Future<void> _initializeFlutterFire() async {
//   // if (_kTestingCrashlytics) {
//   //   // Force enable crashlytics collection enabled if we're testing it.
//   //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
//   // } else {
//   //   // Else only enable it in non-debug builds.
//   //   // You could additionally extend this to allow users to opt-in.
//   //   await FirebaseCrashlytics.instance
//   //       .setCrashlyticsCollectionEnabled(!kDebugMode);
//   // }
//
//   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
//   // if (_kShouldTestAsyncErrorOnInit) {
//   //   await _testAsyncErrorOnInit();
//   // }
// }

Future<void> checkAndInitializeFirebase() async {
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: "ebhc",
      options: getDefaultFirebaseOptions(),
    );
  }
}

// class RiverpodProviderObserver extends ProviderObserver {
//   @override
//   void didUpdateProvider(
//       ProviderBase<Object?> provider,
//       Object? previousValue,
//       Object? newValue,
//       ProviderContainer container,
//       ) {
//     print('''{###
//     "provider": "${provider.name ?? provider.runtimeType}",
//     "oldValue": "$previousValue",
//     "newValue": "$newValue",
//     "container": "${container.toString()}"
// }''');
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  await checkAndInitializeFirebase();
  if (kIsWeb) {
    await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  }

  if (kDebugMode) {
    print("buildFlavor = $buildFlavor");
  }
  // FirebaseFirestore.instance.clearPersistence();

  FlutterError.onError = (errorDetails) {
    // If you wish to record a "non-fatal" exception, please use `FirebaseCrashlytics.instance.recordFlutterError` instead
    List<String?>? allTrace = errorDetails.stack?.toString().split('#').map((e) => e).toList();
    if(allTrace!.isNotEmpty){
      allTrace.remove(null);
      var ebhcLog = allTrace.first!.substring(allTrace.first!.indexOf('  '), allTrace.first!.length).trim();
      FirebaseCrashlytics.instance.setCustomKey('summary', ebhcLog);
      FirebaseCrashlytics.instance.log(ebhcLog);
    }
    FirebaseCrashlytics.instance.setCustomKey('user_uid', FirebaseAuth.instance.currentUser?.uid??'-');
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // await _initializeFlutterFire();
  // 本来はflavorなどで切り分ける
  const isEmulator = (buildFlavor == buildFlavorDevelopment);

  if (isEmulator) {
    if (kDebugMode) {
      print("running on emulator");
    }
    // const localhost = 'localhost';
    // FirebaseFunctions.instance.useFunctionsEmulator(localhost, 5001);
    // FirebaseFirestore.instance.useFirestoreEmulator(localhost, 8080);
    // await Future.wait(
    //   [
    //     // FirebaseAuth.instance.useAuthEmulator(localhost, 9099),
    //     // FirebaseStorage.instance.useStorageEmulator(localhost, 9199),
    //   ],
    // );
    // } else if (kIsWeb) {
    //   await FirebaseFirestore.instance.enablePersistence(
    //       // const PersistenceSettings(synchronizeTabs: true),
    //       );
  }

  await FCMConfig.instance.init(
    onBackgroundMessage: _firebaseMessagingBackgroundHandler,
    defaultAndroidForegroundIcon: '@mipmap/launcher_icon', //default is @mipmap/ic_launcher
    defaultAndroidChannel: const AndroidNotificationChannel(
      'high_importance_channel', // same as value from android setup
      'Fcm config',
      importance: Importance.high,
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('notification'),
    ),
  ).then((value) async {
    if (kDebugMode) {
      final fcmToken = await FCMConfig.instance.messaging.getToken();
      print("FCMToken at main: $fcmToken");
    }
    // if (!kIsWeb) {
    //   FCMConfig.instance.messaging.subscribeToTopic('ssss_test_fcm_topic');
    // }
  });

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);

  /// request location permission on app launch
  requestLocationPermission();

  /// only ios will run timer stream to save location on UI, Android can handle it at Background Service lib
  if (Platform.isIOS) {
    LocationStream((status) async {
      if (status == true) {
        await saveToLocationCollection();
      }
    }).start();
    listenWorkingStatusChanges();
  }

  /// listen auth state changes to save location
  FirebaseAuth.instance.authStateChanges().listen((user) async {
    if(user != null){
      await saveToLocationCollection(interrupt: true);
    }
  });
  runApp(
    // Riverpodでデータを受け渡しできる状態にする
    const ProviderScope(
      // observers: [RiverpodProviderObserver()],
      child: HealthcareApp(),
    ),
  );
}

void requestLocationPermission() async {
  LocationPermission lp = await Geolocator.checkPermission();
  if(lp == LocationPermission.always){
    initializeService();
  }else{
    await Geolocator.requestPermission();
    requestLocationPermission();
  }
}

/// iOS will run background thread periodically with Background Fetch lib
void backgroundFetchScheduleTask() async {
  await BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 15,
        forceAlarmManager: false,
        startOnBoot: true,
        stopOnTerminate: false,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
      ), (taskId) async {
        await checkAndInitializeFirebase();
        User? currentUser = FirebaseAuth.instance.currentUser;
        if(currentUser != null){
          DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();
          if(userDoc['workingStatus'] == 'started'){
            await saveToLocationCollection();
          }
        }
  }, (taskId) async {
    debugPrint('### ios Background fetch timeout id $taskId');
    BackgroundFetch.finish(taskId);
  });
}

/// starting Background Service lib
Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
      autoStartOnBoot: true,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onIosStart,
      onBackground: onIosBackground,
    ),
  );
  service.startService();
  if(Platform.isIOS){
    backgroundFetchScheduleTask();
  }
}

@pragma('vm:entry-point')
void onIosStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  service.on('stopService').listen((event) {
    service.stopSelf();
  });
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  debugPrint('### ios Background service start');
  backgroundFetchScheduleTask();
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
    listenWorkingStatusChanges();
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  LocationStream((update) async {
    if (update == true) {
      await saveToLocationCollection();
    }
  }).start();
}

/// finally save location to firebase collection
/// set interrupt "true" if time gap can ignore
Future<bool> saveToLocationCollection({bool interrupt = false}) async {
  await checkAndInitializeFirebase();
  final user = FirebaseAuth.instance.currentUser;
  try{
    if(user != null){
      Timestamp tsNow = Timestamp.now();
      Position location = await Geolocator.getCurrentPosition();
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if(interrupt == true || userDoc['workingStatus'] == 'started'){
        DocumentSnapshot locInfo = await FirebaseFirestore.instance.collection('location_info').doc(user.uid).get();
        if(locInfo.data() != null){
          Map<String, dynamic> locMap = locInfo.data() as Map<String, dynamic>;
          locMap['timestamp'] = Timestamp.now();
          locMap['location'] = GeoPoint(location.latitude, location.longitude);
          DocumentReference updateLocation = FirebaseFirestore.instance.collection('location_info').doc(user.uid);
          await updateLocation.set(locMap, SetOptions(merge: true));
        }else{
          DocumentReference newLocDoc = FirebaseFirestore.instance.collection('location_info').doc(user.uid);
          Map<String, dynamic> documents = {
            'docId': user.uid,
            'uId': user.uid,
            'timestamp': tsNow,
            'location': GeoPoint(location.latitude, location.longitude),
          };
          await newLocDoc.set(documents);
        }
      }
      /// temporary removed (add in future)
      // DocumentReference newLocHisDoc = FirebaseFirestore.instance.collection('location_info/${user.uid}/history').doc();
      // Map<String, dynamic> hisLocation = {
      //   'timestamp': tsNow,
      //   'loc': GeoPoint(location.latitude, location.longitude),
      // };
      // await newLocHisDoc.set(hisLocation);
    }
  }catch(e){
    FirebaseCrashlytics.instance.setCustomKey('LocationUpdate', e.toString());
  }
  return true;
}

/// currently location save timer is not using this "working status" changes listener
void listenWorkingStatusChanges() async {
  await checkAndInitializeFirebase();
  SharedPreferences shp = await SharedPreferences.getInstance();
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? listener;
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      shp.setInt('loc', 0);
      final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots();
      listener = userDoc.listen((doc) {
        debugPrint('working status: ${doc['workingStatus']}');
        if(doc['workingStatus'] == 'stopped'){
          shp.setBool('wStatus', false);
        }else if(doc['workingStatus'] == 'started'){
          shp.setBool('wStatus', true);
        }
      }, onError: (e){
      });
    } else {
      shp.setBool('wStatus', false);
      listener?.cancel();
      listener = null;
    }
  });
}

//flutter build apk --split-per-abi