import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';
part 'settings_state.g.dart';

// 設定関連のstate(永続化するならstateではなくdata-model)

@freezed
class SettingsState with _$SettingsState {
  // 中身objectの場合は以下
  // @JsonSerializable(explicitToJson: true)

  const SettingsState._();

  const factory SettingsState({
    @Default(true) bool isEasyView, // Add your fields here
  }) = _SettingsState;

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);

  factory SettingsState.fromJsonString(String jsonStr) =>
      _$SettingsStateFromJson(json.decode(jsonStr));

  String toJsonString() {
    return json.encode(toJson());
  }
}
