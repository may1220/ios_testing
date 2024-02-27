 //import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:ebhc/data_models/firebase_auth_provider.dart';
import 'package:ebhc/data_models/firebase_firestore_user_profile_stream_provider.dart';
import 'package:ebhc/data_models/health_state.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

// ひとまず、userProfileのstreamを拾ってcurrentHealthだけにfilterしてstream出力する
// 構造的にはこれでOk: 特に参照側でState,Futureでないと困る話はないはず
final currentHealthStreamProvider =
    StreamProvider.autoDispose<HealthState>((ref) {
  //
  final userProfileAsyncValue = ref.watch(userProfileStreamProvider);
  var userProfile = userProfileAsyncValue.asData?.value;
  if (userProfile != null) {
    final currentHealthJson = userProfile.data()!["currentHealth"];
    var currentHealth = HealthState.fromJson(currentHealthJson);

    // 値が取れた時に更新しようと思っても、
    // Providers are not allowed to modify other providers during their initialization.
    // 依存先がwatchすることでしか連携できない
    // ref.read(heartRateStateProvider.notifier).update(currentHealth.heartRate);
    return Stream.value(currentHealth);
  } else {
    const nullHealthState = HealthState();
    return Stream.value(nullHealthState);
  }
});

// // healthは履歴保持しないならstreamでもstateでもどちらでもよい
// // dashboard側の表示をstreamでする必要はなく、通常のstate更新で再描画でよいはず

// // firebase側docはsnapshotでstreamとして取るので、streamとして一旦流すほうが自然

// // "users/{uid}"でのdocだとfcmTokenなど他のものが反映されてしまうので、
// // 監視範囲をどう限定するか
// //
// //   個別にui側でselectで限定監視することはできる
// //     UI側の記述が増える
// //   なんらかsubsetなstateを定義して、ui側ではそれをwatchする
// //     それほど要素が多くないならこのsubset state全体の監視でも負荷にはならないはず
// //   streamで変化を知る
// //

// class HealthStateNotifier extends StateNotifier<HealthState> {
//   HealthStateNotifier(healthState, this.ref) : super(healthState) {
//     //// listen stream ?
//     //() async {
//     //  final healthState = ref.watch(healthStateStreamProvider.future);
//     //  state = healthState;
//     //}();
//   }

//   final ref; // いらない？

//   update(newState) {
//     state = newState;
//   }
// }

// final healthStateNotifierProvider =
//     StateNotifierProvider.autoDispose<HealthStateNotifier, HealthState>((ref) {
//   const healthState = HealthState();
//   // final Future<HealthState> healthState = await ref.watch(healthStateStreamProvider.future);
//   return HealthStateNotifier(healthState, ref);
// });

// // ストリームで流す意味はない
// // state更新だけでwidget側が反応できる
// /// health statusを取ってくる
// final healthStateStreamProvider = StreamProvider.autoDispose((ref) async {
//   final user = ref.read(userProvider);
//   // final hs = ref.read(healthStateNotifierProvider.notifier);

//   Map<String, dynamic> current = await getCurrentHealth(user!); // current
//   if (kDebugMode) {
//     print("■ user: ${user.uid}");
//   }

//   final stream = current.map(
//     (healthStatus) {
//       if (healthStatus.data() != null) {
//         final newHealthState = HealthState.fromJson(healthStatus.data()!);
//         // hs.update(newHealthState);
//         if (kDebugMode) {
//           print("■ health status: update");
//         }
//         return newHealthState;
//       } else {
//         return const HealthState();
//       }
//     },
//   );

//   return stream;
// });

// // TODO: modelに変換すべき
// Future<Map<String, dynamic>> getCurrentHealth(User user) async {
//   final doc =
//       await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//   if (!doc.exists) {
//     throw Exception("user data is not exist");
//   }
//   final data = doc.data()!; // 多分docが存在すればdata()でnullが返ることはないはず

//   final currentHealth = data["currentHealth"];
//   if (currentHealth == null) {
//     throw Exception("currentHealth is not exist");
//   }

//   return currentHealth as Map<String, dynamic>;
// }
