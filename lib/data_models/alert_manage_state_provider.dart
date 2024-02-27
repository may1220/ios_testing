import 'package:ebhc/data_models/alert_manage_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlertManageStateNotifier extends StateNotifier<AlertManageState> {
  AlertManageStateNotifier() : super(const AlertManageState());

  setGroupMode({isGroupMode = false}) {
    state = state.copyWith(isGroupAlert: isGroupMode);
  }
}

final alertManageStateNotifierProvider = StateNotifierProvider.autoDispose<
    AlertManageStateNotifier, AlertManageState>((ref) {
  return AlertManageStateNotifier();
});
