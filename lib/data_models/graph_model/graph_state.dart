import 'dart:async';

import 'package:ebhc/data_models/firebase_auth_repository.dart';
import 'package:ebhc/data_models/firestore_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

// StreamProvider to get current DateTime
final timeStreamProvider = StreamProvider<DateTime>((ref) {
  final controller = StreamController<DateTime>();
  DateTime currentDate = DateTime.now();
  controller.add(currentDate);

// to emit current DateTime every second
  void emitCurrentDate() {
    DateTime newDate = DateTime.now();
    if (currentDate.day != newDate.day) {
      controller.add(newDate);
      currentDate = newDate;
    }
    Future.delayed(const Duration(seconds: 1)).then((_) => emitCurrentDate());
  }

// Start emitting current DateTime
  emitCurrentDate();

// Dispose the controller when no longer needed
  ref.onDispose(() {
    controller.close();
  });

// Return the stream from the controller
  return controller.stream;
});

final reloadTriggerProvider = StateProvider<int>((ref) => 0);

final dateStreamProvider = StreamProvider.autoDispose((ref) {
  final uId = ref.watch(firebaseAuthUserIdProvider).value;
  if (uId == null) {
    return const Stream.empty();
  }

  // Watch the timeStreamProvider to get the current DateTime
  var dateTimeNow = ref.watch(timeStreamProvider);

  //this date is current date
  String currentDate =
      DateFormat('yyyy-MM-dd').format(dateTimeNow.value ?? DateTime.now());

  var reloadCount =
      ref.watch(reloadTriggerProvider); // calling watch for reload

  String lessThan =
      "${dateTimeNow.value!.year}-${dateTimeNow.value!.month}-${dateTimeNow.value!.day}"; // this date is next day

  if (kDebugMode) {
    print("Time Stream Provider ############## $currentDate");
    print("The Last Time Provider ############## $lessThan");
  }
  final firestore = ref.read(firebaseFirestoreProvider);
  final snapshots = firestore
      .collection('users')
      .doc(uId)
      .collection('health')
      .where('time', isGreaterThanOrEqualTo: currentDate)
      .snapshots();
  // retrieve today data from firebase

  return snapshots;
});

final dateTimeStateProvider = Provider.autoDispose((ref) {
  final asyncAlertsQuery = ref.watch(dateStreamProvider);
  return asyncAlertsQuery.whenData((snapshot) {
    return snapshot.docs.map((doc) {
      print("Data ############################################ ${doc.data()}");
      return doc.data();
    });
  });
});

/* final healthListStateProvider = StreamProvider.autoDispose((ref) {
  final uId = ref.watch(firebaseAuthUserIdProvider).value;
  if (uId == null) {
    return const Stream.empty();
  }
  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String dateTime = "$currentDate 00:00:00";
  final firestore = ref.read(firebaseFirestoreProvider);
  final snapshots = firestore
      .collection('users')
      .doc(uId)
      .collection('health')
      .where('time', isGreaterThanOrEqualTo: dateTime)
      .get()
      .asStream();
  return snapshots;
}); */
/* 
class GraphNotifier extends StateNotifier<List<ChartData>> {
  Ref ref;
  GraphNotifier(this.ref) : super([]) {
    final graphData = ref.watch(dateTimeStateProvider).value; 

    List<ChartData> chartDataList = [];
    if (graphData != null) {
      for (var v in graphData) {
        chartDataList.add(ChartData(
            (DateTime.parse(HealthState.fromJson(v).time)
                .millisecondsSinceEpoch),
            HealthState.fromJson(v).heatstrokeLevel));
      }
      state = chartDataList;
    }
  }
}

final graphProvider = StateNotifierProvider<GraphNotifier, List<ChartData>>(
    (ref) => GraphNotifier(ref));
 */
