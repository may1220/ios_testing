import 'package:ebhc/data_models/firebase_auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth_user_info.freezed.dart';
part 'auth_user_info.g.dart';

// firebase authのuser provider

@freezed
class AuthUserInfo with _$AuthUserInfo {
  const factory AuthUserInfo({
    @Default('') String uId, // Add your fields here
  }) = _AuthUserInfo;

  factory AuthUserInfo.fromJson(Map<String, dynamic> json) =>
      _$AuthUserInfoFromJson(json);
}

// 一旦プロバイダー側でlistenさせている
// start時にuIdが取れていないようだ
class AuthUserInfoNotifier extends StateNotifier<AuthUserInfo> {
  AuthUserInfoNotifier(this.ref) : super(const AuthUserInfo()) {
    if (kDebugMode) {
      print("AuthUserInfoNotifier: created");
    }
  }

  final Ref ref;

  @override
  void dispose() {
    super.dispose();
    if (kDebugMode) {
      print("■ userInfo disposed");
    }
  }

  void setUser(uId) {
    if (kDebugMode) {
      print("■ uId changed: $uId");
    }
    state = state.copyWith(uId: uId);
  }
}

// autoDisposeは元streamがautoDispose()なら必要
final authUserInfoProvider =
    StateNotifierProvider.autoDispose<AuthUserInfoNotifier, AuthUserInfo>(
        (ref) {
  final authUserInfoNotifier = AuthUserInfoNotifier(ref);

  ref.watch(firebaseAuthUserIdStreamProvider).when(
      data: (userId) {
        if (kDebugMode) {
          print("■ authUserId stream data arrived: $userId");
        }
        authUserInfoNotifier.setUser(userId);
      },
      error: (error, stack) => {},
      loading: () => {});

  return authUserInfoNotifier;
});
