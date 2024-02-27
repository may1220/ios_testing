// ユーザー情報の受け渡しを行うためのProvider
import 'package:ebhc/data_models/firebase_auth_repository.dart';
import 'package:ebhc/data_models/firestore_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// docRefで引き渡し
final userProfileRefProvider = Provider.autoDispose((ref) {
  final uId = ref.watch(firebaseAuthUserIdProvider).value;
  if (uId == null) {
    if (kDebugMode) {
      print("userProfileRefProvider: no login user");
    }
    return null;
  }
  if (kDebugMode) {
    print("userProfileRefProvider: login user: $uId");
  }
  return ref.watch(firebaseFirestoreProvider).collection('users').doc(uId);
});

// 現在のauth userに対するfirebaseの"/users/{uid}"のsnapshotのstreamを返す
// auth userがない場合はempty streamを返す
final userProfileStreamProvider = StreamProvider.autoDispose((ref) {
  final docRef = ref.watch(userProfileRefProvider);
  if (docRef == null) {
    if (kDebugMode) {
      print("userProfileStreamProvider: no user profile doc");
    }
    return const Stream.empty();
  }
  if (kDebugMode) {
    print("userProfileStreamProvider: user profile doc: ${docRef.path}");
  }
  return docRef.snapshots();
});

final errorMessageProvider = StateProvider<String>((ref) {
  return "";
});

final isSuccessProvider = StateProvider<bool>((ref) {
  return false;
});

final isSuccessMsgProvider = StateProvider<String>((ref) {
  return "";
});
