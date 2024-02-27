import 'package:freezed_annotation/freezed_annotation.dart';
part 'heart_rate_state.freezed.dart';
part 'heart_rate_state.g.dart';

// 生のfirestoreデータモデル

@freezed
class HeartRateState with _$HeartRateState {
  const factory HeartRateState({
    int? heartRate, // 心拍数
    @Default(999) int minHeartRate,
    @Default(0) int maxHeartRate,
    @Default("") String minTime,
    @Default("") String maxTime,
    String? time,
    @Default(false) bool isTime,
  }) = _HeartRateState;

  factory HeartRateState.fromJson(Map<String, dynamic> json) =>
      _$HeartRateStateFromJson(json);
}


    //

