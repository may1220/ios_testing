import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_manage_state.freezed.dart';
part 'alert_manage_state.g.dart';

@freezed
class AlertManageState with _$AlertManageState {
  const factory AlertManageState({
    @Default(false) bool isGroupAlert, // Add your fields here
  }) = _AlertManageState;

  factory AlertManageState.fromJson(Map<String, dynamic> json) =>
      _$AlertManageStateFromJson(json);
}
