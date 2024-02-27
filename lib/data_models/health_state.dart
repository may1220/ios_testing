import 'package:freezed_annotation/freezed_annotation.dart';
part 'health_state.freezed.dart';
part 'health_state.g.dart';

// 生のfirestoreデータモデル
@freezed
class HealthState with _$HealthState {
  const factory HealthState({
    @Default("") String uName, // Smartfit ID
    @Default("") String sName, // センサID
    @Default("") String time, // 計測日時
//    @Default() DateTime timestamp, // 計測日時
    int? heartRate, // 心拍数
    int? heatstrokeLevel, // 熱中症レベル
    int? healthLevel, // 体調レベル
    @Default(0.0) double templerature, // 気温
    @Default(0.0) double ralativeHumidity, // 湿度
    @Default(0.0) double wbgt, // WBGT値
  }) = _HealthState;

  factory HealthState.fromJson(Map<String, dynamic> json) =>
      _$HealthStateFromJson(json);
}
