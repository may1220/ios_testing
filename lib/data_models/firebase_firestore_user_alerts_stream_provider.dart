// ユーザー情報の受け渡しを行うためのProvider
import 'package:ebhc/data_models/firebase_auth_repository.dart';
import 'package:ebhc/data_models/firestore_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// StreamProviderを使うことでStreamも扱うことができる
// ※ autoDisposeを付けることで自動的に値をリセットできます
// ひとまず生のsnapshotsで引き渡し
//TODO: app側でのalertオブジェクトで流れるように

final userAlertsSnapshotStreamProvider = StreamProvider.autoDispose((ref) {
  final uId = ref.watch(firebaseAuthUserIdProvider).value;
  if (uId == null) {
    return const Stream.empty();
  }
  final firestore = ref.read(firebaseFirestoreProvider);
  final snapshots = firestore
      .collection('users')
      .doc(uId)
      .collection('alerts')
      .orderBy('time', descending: true)
      .limit(50)
      .snapshots();
  return snapshots;
});

final userAlertsStreamProvider = Provider.autoDispose((ref) {
  final asyncAlertsQuery = ref.watch(userAlertsSnapshotStreamProvider);
  return asyncAlertsQuery.whenData((snapshot) {
    return snapshot.docs.map((doc) => doc.data());
  });
});
