// ユーザー情報の受け渡しを行うためのProvider
import 'package:ebhc/data_models/firebase_firestore_user_profile_stream_provider.dart';
import 'package:ebhc/data_models/user_state.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// userProfileStreamから最新状態を取り出しUserState()として戻す
// 本当はFutureではなくStateNotifierとして処理したいところ
// ただし、docの無駄な二度読みはしたくない
// 使う側でref.watch()するだけで値を使わなければよいのか？

// logout時にfirestore permission error
// login時にnull userでアクセスにいってしまう
// signout→streamがdisposeされたあとにアクセスがある→exception
//  ひとまずexceptionをnullで抑え込んで対処
//  本質的にはアクセスしないようにすべきか
//  (auto-disposeなproviderに関してはすべてあり得るので)
final userStateProvider = FutureProvider.autoDispose<UserState?>((ref) async {
  final userProfileSnapshot = await ref
      .watch(userProfileStreamProvider.future)
      .onError((error, stackTrace) {
    print("Error userProfile failure snapshot ${error.toString()}");
  });
  final userProfile = userProfileSnapshot?.data();

  if (userProfile != null) {
    final userState = UserState.fromJson(userProfile);
    return userState;
  } else {
    return null;
  }
});
/* final currentHealthStreamProvider =
    StreamProvider.autoDispose<HealthState>((ref) {
  //
  final userProfileAsyncValue = ref.watch(userProfileStreamProvider);
  var userProfile = userProfileAsyncValue.asData?.value;
  if (userProfile != null) {
    final currentHealthJson = userProfile.data()!["currentHealth"];
    final currentHealth = HealthState.fromJson(currentHealthJson);
    // 値が取れた時に更新しようと思っても、
    // Providers are not allowed to modify other providers during their initialization.
    // 依存先がwatchすることでしか連携できない
    // ref.read(heartRateStateProvider.notifier).update(currentHealth.heartRate);
    return Stream.value(currentHealth);
  } else {
    const nullHealthState = HealthState();
    return Stream.value(nullHealthState);
  }
}); */
final userStateProviders = StreamProvider.autoDispose<UserState>((ref) {
  final userProfileSnapshot = ref.watch(userProfileStreamProvider).value;
  final userProfile = userProfileSnapshot.data();
  if (kDebugMode) {
    print(
        "Error userProfile ################## sfailure snapshot $userProfile $userProfileSnapshot");
  }
  if (userProfile != null) {
    final userState = UserState.fromJson(userProfile);
    return Stream.value(userState);
  } else {
    return Stream.value(const UserState());
  }
});

// class UserStateNotifier extends StateNotifier<UserState> {
//   UserStateNotifier(this.reader) : super(const UserState());
//   final Reader reader;


// // }

// final userStateNotifierProvider =
//     StateNotifierProvider<UserStateNotifier, UserState>((ref) async {
//   final userProfileSnapshot = await ref.watch(userStateProvider);
//   return UserStateNotifier(ref.read);
// });
