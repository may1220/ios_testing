// group情報の受け渡しを行うためのProvider
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebhc/data_models/firestore_repository.dart';
import 'package:ebhc/data_models/user_state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// StreamProviderを使うことでStreamも扱うことができる
// ※ autoDisposeを付けることで自動的に値をリセットできます
// ひとまず生のsnapshotsで引き渡し
//TODO: app側でのalertオブジェクトで流れるように

final groupAlertsSnapshotStreamProvider =
    StreamProvider.autoDispose<QuerySnapshot<Map<String, dynamic>>>((ref) {
  final userState = ref.watch(userStateProvider).value;
  if (userState == null) {
    return const Stream.empty();
  }
  final gId = userState.gId;

  final firestore = ref.read(firebaseFirestoreProvider);
  final snapshots = firestore
      .collection('groups')
      .doc(gId)
      .collection('alerts')
      .orderBy('time', descending: true)
      .limit(50)
      .snapshots();
  return snapshots;
});

final groupAlertsStreamProvider = Provider.autoDispose((ref) {
  final asyncAlertsQuery = ref.watch(groupAlertsSnapshotStreamProvider);
  return asyncAlertsQuery.whenData((snapshot) {
    return snapshot.docs.map((doc) => doc.data());
  });
});
