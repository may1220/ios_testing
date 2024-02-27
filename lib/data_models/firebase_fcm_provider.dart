import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebhc/data_models/firebase_auth_repository.dart';
import 'package:ebhc/data_models/firebase_firestore_user_profile_stream_provider.dart';
import 'package:ebhc/data_models/user_state.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

part 'firebase_fcm_provider.freezed.dart';

// 独立したローカル状態を管理すべきなのか？
@freezed
class FcmState with _$FcmState {
  const factory FcmState({
    @Default("") String token, // Add your fields here
  }) = _FcmStat;
}

final fcmStateProvider =
    StateNotifierProvider<FcmStateNotifier, FcmState>((ref) {
  return FcmStateNotifier(ref);
});

// Todo: ローカルで値を管理すべきなのか再考
// サーバー更新し、その更新をapp側はsnapshot経由で知りFcmState更新する方法？
// ローカルのFcmState更新し、それを別にwatchしている側でサーバー更新？
class FcmStateNotifier extends StateNotifier<FcmState> {
  FcmStateNotifier(this.ref) : super(const FcmState()) {
    if (kDebugMode) {
      print("FcmStateNotifier");
    }
  }
  final Ref ref;
  void initToken() {
    if (kDebugMode) {
      print("FcmStateNotifier: initToken");
    }
    () async {
      final fcmToken = await FCMConfig.instance.messaging.getToken();
      if (fcmToken != null) {
        await setToken(fcmToken);
      }
    }();
  }

//Push Notification click event in background
  void changeRouteAfterOnClick(context)async{
    // FirebaseMessaging.instance.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      final routemaster = Routemaster.of(context);
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final userStateDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      UserState userState = UserState.fromJson(userStateDoc.data()!);
      final isLeader = (userState != null) ? userState.isLeader : false;
      if (isLeader == true) {
        routemaster.push("/alerts/${message.data["docId"]}");
      } else {
        routemaster.push("/");
      }
    });
  }

  Future<void> setToken(token) async {
    final fcmToken = token ?? "";
    state = state.copyWith(token: fcmToken);
    if (kDebugMode) {
      print('🐯 FCM TOKEN: $fcmToken');
    }
    // update token in firestore
    final uId = ref.read(firebaseAuthUserIdProvider).value;
    if (uId == null) {
      if (kDebugMode) {
        print('🐯 no user: ignore updating fcmToken');
      }
    } else {
      if (kDebugMode) {
        print('🐯 updating FCM TOKEN in user doc: $uId token: "$fcmToken"');
      }
      final docRef = ref.read(userProfileRefProvider);
      if (kDebugMode) {
        print('🐯 updating FCM TOKEN in user doc: $uId token: "$fcmToken"');
      }
      if (docRef != null) {
        final doc = await docRef.get();
        if (doc.exists) {
          await docRef.update({"fcmToken": fcmToken});
          if (kDebugMode) {
            print('🐯 updated FCM TOKEN in user doc: $uId: "$fcmToken"');
          }
        } else {
          if (kDebugMode) {
            print('🐯 user doc is not exist: $uId');
          }
        }
      } else {
        if (kDebugMode) {
          print('🐯 user doc null ******: $uId');
        }
      }
    }
  }
}
