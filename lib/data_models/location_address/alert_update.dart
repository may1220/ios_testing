import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebhc/data_models/location_address/alert_document.dart';
import 'package:ebhc/main.dart';
import 'package:ebhc/utils/app_constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final alertStreamProvider = StreamProvider.autoDispose.family<List<Map<String, dynamic>>, String>((ref, uid) {
  final collectionReference = FirebaseFirestore.instance
      .collection('users/$uid/alerts')
      .orderBy('timestamp')
      .limitToLast(1);
  collectionReference.snapshots().listen((querySnapshot) async {
    List<AlertDocument> alertList = querySnapshot.docs
        .map((e) => AlertDocument.fromJson(e.data())).toList();
    doBackgroundLocationUpdateTask(alertList.last.docId!, alertList.last.timestamp!);
  });
  return const Stream.empty();
});

void doBackgroundLocationUpdateTask(String iDocId, int docT) async {
  DartPluginRegistrant.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  int curTime = DateTime.now().millisecondsSinceEpoch;
  int gapTime = AppConstants.timeGap.inMilliseconds;
  bool withinGap = (curTime - docT) < gapTime;
  String? sDocId = prefs.getString('docid');
  if (withinGap && sDocId != iDocId) {
    await checkAndInitializeFirebase();
    double updateLatitude = AppConstants.latitude;
    double updateLongitude = AppConstants.longitude;
    Position pos = await Geolocator.getCurrentPosition();
    updateLatitude = pos.latitude;
    updateLongitude = pos.longitude;
    DocumentReference alertStatus = FirebaseFirestore.instance.collection('alert_status').doc(iDocId);
    await alertStatus.set(
        {'latitude': updateLatitude, 'longitude': updateLongitude},
        SetOptions(merge: true));
    await prefs.setString('docid', iDocId);
      saveToLocationCollection(interrupt: true);
  }
  return Future.value(true);
}