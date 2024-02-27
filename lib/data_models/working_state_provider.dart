import 'package:cloud_functions/cloud_functions.dart';
import 'package:ebhc/data_models/auth_user_info.dart';
import 'package:ebhc/data_models/graph_model/graph_state.dart';
import 'package:ebhc/data_models/heart_rate_state_provider.dart';
import 'package:ebhc/data_models/working_state.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkingStateNotifier extends StateNotifier<WorkingState> {
  WorkingStateNotifier(this.ref) : super(const WorkingState());
  final Ref ref;

  workingControl(String workingStatus) {
    final userInfo = ref.read(authUserInfoProvider);
    final uId = userInfo.uId;

    if (kDebugMode) {
      print("$workingStatus: uId: $uId");
    }
    () async {
      if (workingStatus == "starting") {
        ref
            .watch(reloadTriggerProvider.notifier)
            .state++; // Increment the state of reloadTriggerProvider using its notifier
      }
      final result = await FirebaseFunctions.instance
          .httpsCallable('working-control')
          .call({"uId": uId, "workingStatus": workingStatus});
      if (kDebugMode) {
        print("result: ${result.data}");
      }
    }();
  }

  start() {
    state = state.copyWith(isWorking: true);
    workingControl("starting");
  }

  stop() {
    state = state.copyWith(isWorking: false);
    workingControl("stopping");
  }

  // toggleは機能としてあまりよろしくない
  toggle(currentWorkingStatus) {
    switch (currentWorkingStatus) {
      case "stopped":
        start();
        break;
      case "started":
        stop();
        break;
      default:
        break;
    }
  }
}

final workingStateNotifierProvider =
    StateNotifierProvider.autoDispose<WorkingStateNotifier, WorkingState>(
        (ref) {
  return WorkingStateNotifier(ref);
});
