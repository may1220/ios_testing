//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:ebhc/data_models/firebase_auth_provider.dart';
import 'dart:math';

import 'package:ebhc/data_models/firebase_auth_repository.dart';
import 'package:ebhc/data_models/firestore_repository.dart';
import 'package:ebhc/data_models/graph_model/graph_state.dart';
import 'package:ebhc/data_models/health_state.dart';
import 'package:ebhc/data_models/health_state_provider.dart';
import 'package:ebhc/data_models/heart_rate_state.dart';
import 'package:flutter/foundation.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class HeartRateStateNotifier extends StateNotifier<HeartRateState> {
  HeartRateStateNotifier() : super(const HeartRateState());

  update(HealthState heartRate) {
    if (kDebugMode) {
      print(
          "update heartRate: $heartRate now: ${state.heartRate} [${state.minHeartRate}, ${state.maxHeartRate}]");
    }

    if (heartRate.heartRate != null) {
      if (heartRate.heartRate != -1 && heartRate.heartRate != state.heartRate) {
        final newMinHeartRate = min(state.minHeartRate, heartRate.heartRate!);
        final newMaxHeartRate = max(state.maxHeartRate, heartRate.heartRate!);
        var dateTime = DateTime.parse(
            heartRate.time == "" ? DateTime.now().toString() : heartRate.time!);
        String hour = dateTime.hour.toString();
        String minute = dateTime.minute.toString();
        String time = "$hour:$minute";
        String currentTime = DateFormat("HH:mm").format(DateTime.now());
        if (mounted) {
          state = HeartRateState(
              heartRate: heartRate.heartRate,
              minHeartRate: newMinHeartRate,
              maxHeartRate: newMaxHeartRate,
              maxTime:
                  newMaxHeartRate != state.maxHeartRate ? time : state.maxTime,
              minTime:
                  newMinHeartRate != state.minHeartRate ? time : state.minTime,
              time: currentTime,
              isTime: true);
        }
        if (kDebugMode) {
          print(
              "update heartRate: $heartRate => [$newMinHeartRate, $newMaxHeartRate]");
        }
      }
    } else {
      state = const HeartRateState();
    }
  }
}

final heartRateStateProvider =
    StateNotifierProvider.autoDispose<HeartRateStateNotifier, HeartRateState>(
        (ref) {
  ref.listen<HealthState>(currentHealthStreamProvider.select((v) => v.value!),
      (prevValue, newValue) {
    ref.notifier.update(newValue);
  });
  return HeartRateStateNotifier();
});

// providerlistenable<HealhState> と AutoDisposeStreamProvider<HealthState>では型が合わない
// final heartRateProvider =
//     StateNotifierProvider.autoDispose<HeartRateStateNotifier, HeartRateState>(
//         (ref) {
//   ref.listen<HealthState>(currentHealthStreamProvider, (prevValue, newValue) => {
//       ref.notifier.update(newValue);
//     }
//   );
//   return HeartRateStateNotifier();
// });

// 初期化中にupdateを呼ぶことになってエラーか。
// final heartRateProvider =
//     StateNotifierProvider.autoDispose<HeartRateStateNotifier, HeartRateState>(
//         (ref) {
//   final healthAsyncValue = ref.watch(currentHealthStreamProvider)
//       //    .onError((error, stackTrace) => null);
//       ;
//   healthAsyncValue.whenData((value) => {ref.notifier.update(value.heartRate)});
//   return HeartRateStateNotifier();
// });

// --- ↓これが一番マシだが、min,max保存できていない
// (callback内で現在のstateが取れないと)

// これだと依存するcurrentHealth更新ごとに新規作成で古い統計値を保持した更新にならない
// 依存関係による作り直しが発生するなら、統計値はstorage保存が必要か？
// user切り替えなどを考えると、サーバー側で保持する方が良さそう
// (過去にログインしたユーザーの情報が残るゴミデータ量は大したことはないが。
//  かといってlogoutのcleanup処理を入れたくはない)
// final heartRateProvider =
//     StateNotifierProvider.autoDispose<HeartRateStateNotifier, HeartRateState>(
//         (ref) {
//   final hrs = HeartRateStateNotifier();
//   final healthAsyncValue = ref.watch(currentHealthStreamProvider)
//       //    .onError((error, stackTrace) => null);
//       ;
//   final hr = healthAsyncValue.asData?.value;
//   if (hr != null) {
//     hrs.update(hr.heartRate);
//   }
//   return hrs;
// });

//     StateNotifierProvider.autoDispose<HeartRateStateNotifier, HeartRateState>(
//         (ref) async {
//   final healthStateAsyncValue = await ref.watch(currentHealthStreamProvider);
//   final hr = healthStateAsyncValue.asData?.value;
//   if (hr == null) {
//     return HeartRateState();
//   }
//   return HeartRateState()
// });

// 依存関係性を逆に考えstream側で更新時にnotifier.update()するというのは使い方として根本的にNG
// final heartRateStateProvider =
//     StateNotifierProvider.autoDispose<HeartRateStateNotifier, HeartRateState>(
//         (ref) {
//   final hrs = HeartRateStateNotifier();
//   return hrs;
// });

// streamからselectでnull or valueで必要なものを取り出し、それを監視
//  監視値の更新時には、stateをupdateで更新する(state notifierのrenewはない)

class NewHeratRateStateNotifier extends StateNotifier<HeartRateState> {
  NewHeratRateStateNotifier() : super(const HeartRateState());
  update(HeartRateState heartRate) {
    if (heartRate.heartRate != -1 &&
        (heartRate.maxHeartRate != state.maxHeartRate ||
            heartRate.minHeartRate != state.minHeartRate)) {
      state = HeartRateState(
          heartRate: heartRate.heartRate,
          minHeartRate: heartRate.minHeartRate,
          maxHeartRate: heartRate.maxHeartRate,
          maxTime: heartRate.maxTime,
          minTime: heartRate.minTime);
    } else {
      print("object ***************** $heartRate");
    }
  }
}

final newHeartRateStateProvider = StateNotifierProvider.autoDispose<
    NewHeratRateStateNotifier, HeartRateState>((ref) {
  ref.listen<HeartRateState>(healthListState, (previous, nextValue) {
    ref.notifier.update(nextValue);
  });
  return NewHeratRateStateNotifier();
});

final healthListState = StateProvider.autoDispose<HeartRateState>((ref) {
  final data = ref.watch(dateStreamProvider);
  List<HealthState> healthStateList = [];
  HeartRateState hrs = const HeartRateState();

  data.whenData((value) {
    for (var element in value.docs) {
      if (element.data()['heartRate'] != null) {
        healthStateList.add(HealthState.fromJson(element.data()));
      }
    }
    healthStateList.sort(
        (dataOne, dataTwo) => dataOne.heartRate!.compareTo(dataTwo.heartRate!));
    hrs = HeartRateState(
        heartRate: healthStateList.first.heartRate,
        minHeartRate: healthStateList.first.heartRate!,
        maxHeartRate: healthStateList.last.heartRate!,
        maxTime: healthStateList.last.time!,
        minTime: healthStateList.first.time!);
    return hrs;
  });
  return hrs;
});
