// temporary util functions

// update doc
// TODO: 機能実装をviewから追い出す
//
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateUserName(String uId, String name) async {
  // update doc
  // TODO: 機能実装をviewから追い出す
  await FirebaseFirestore.instance.collection('users').doc(uId).update({
    'name': name,
  });
}
