import 'package:ebhc/data_models/firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

//https://qiita.com/hummer/items/65b296803f8b200838bd
// flutter-webだとログイン状態維持がうまくいかない？(2020年なので古い？)

// rawレベルでauth state changesからuser.uidを流すstream provier
// loginしているかどうかのstream provider
//
// null, nullなどの場合も、null(false), null(false)で流れる
//
// https://torikatsu923.hatenablog.com/entry/2022/04/17/131146
// 前の状態と比較して変化したときだけ流すstreamを作り直したほうが良いのかも？

// https://qiita.com/tfandkusu/items/e6446008dee2ae375105
//

// ひとまずstreamに対するdistinctでuniq化はできるはず
// autoDisposeしたほうがいいのかどうかは使い所によるか？

// firebaseAuthのinstanceを返すだけ
final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

/// 認証状態プロバイダー
final firebaseAuthIsAuthUserStreamProvider = StreamProvider.autoDispose((ref) {
  return ref
      .watch(firebaseAuthProvider)
      .authStateChanges()
      .distinct((first, second) => first?.uid == second?.uid)
      .map((user) => user != null);
});

/// UserIdプロバイダー
final firebaseAuthUserIdStreamProvider = StreamProvider.autoDispose((ref) {
  return ref
      .watch(firebaseAuthProvider)
      .authStateChanges()
      .distinct((first, second) {
    return first?.uid == second?.uid;
  }).map((user) => user?.uid);
});

// これは単に読み出すものであり、更新されない
// 更新が伝搬しないので呼び出す側でrebuildされない
final firebaseAuthCurrentUserProvider = Provider((ref) {
  final currentUser = ref.watch(firebaseAuthProvider).currentUser;
  if (kDebugMode) {
    print('[firebaseAuthCurrentUserProvider]: $currentUser');
  }
  return currentUser;
});

// streamから取り出して返すもの
// streamからfutureを取り出すのでasync/awaitで、
// そうなるとProviderとしてはFutureProvider
// todo: (deprecated) 呼び出し側でstream→futureする方向で要修正
final firebaseAuthUserIdProvider = FutureProvider.autoDispose((ref) async {
  final currentUser = await ref.watch(firebaseAuthUserIdStreamProvider.future);
  if (kDebugMode) {
    print('[firebaseAuthCurrentUserProvider]: $currentUser');
  }
  return currentUser;
});

final addNewUser = FutureProvider.autoDispose((ref) {
  return ref
      .watch(firebaseFirestoreProvider)
      .collection('users')
      .add({})
      .then((value) {})
      .catchError((e) {});
});
