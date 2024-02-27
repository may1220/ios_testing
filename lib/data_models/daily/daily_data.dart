import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_data.freezed.dart';
part 'daily_data.g.dart';

@freezed
class DailyData with _$DailyData {
  const factory DailyData({
    @Default("") String time,
    @Default("") String label,
    @Default(0) int temperature,
    @Default(0) int iconCode,
  }) = _DailyData;

  factory DailyData.fromJson(Map<String, dynamic> json) =>
      _$DailyDataFromJson(json);
}
