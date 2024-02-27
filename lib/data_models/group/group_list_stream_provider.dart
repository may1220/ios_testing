import 'package:ebhc/data_models/firebase_firestore_user_profile_stream_provider.dart';
import 'package:ebhc/data_models/firestore_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final groupListSP = StreamProvider.autoDispose((ref) {
  final firestore = ref.read(firebaseFirestoreProvider);
  final snapshots = firestore.collection('groups').snapshots();
  return snapshots;
});

final groupListStreamProvider = Provider.autoDispose((ref) {
  final asyncAlertsQuery = ref.watch(groupListSP);
  return asyncAlertsQuery.whenData((snapshot) {
    // return snapshot.docs.map((doc) => doc.data());
    return snapshot.docs.map((doc) => doc.data());
  });
});

final groupuserStreamProvider = Provider.autoDispose((ref) {
  final asyncAlertsQuery = ref.watch(groupListSP);
  return asyncAlertsQuery.whenData((snapshot) {
    return snapshot.docs.map((doc) => doc.data().entries.forEach((element) {
          ref
              .watch(firebaseFirestoreProvider)
              .collection('users')
              .doc(element.key)
              .snapshots();
        }));
  });
});

final groupMembersProvider = StreamProvider.autoDispose((ref) {
  final firestore = ref.read(firebaseFirestoreProvider);
  // user info and take group id
  final asyncAlertsQuery = ref.watch(userProfileRefProvider);
  // print("User group list ############### $asyncAlertsQuery");

  final userData = asyncAlertsQuery?.snapshots();
  print("User group list ############### $userData");
  if (userData != null) {
    userData.listen((event) {
      print("User Data ############### ${event.data()}");
    });
  }

  // fianal membersData = firestore.collection(userData.)
  // return asyncAlertsQuery.whenData((snapshot) {
  // return snapshot.docs.map((doc) => doc.data());
  //   return snapshot;
  // });
  return Stream.value(userData);
});
