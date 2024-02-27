import 'package:freezed_annotation/freezed_annotation.dart';

part 'hourly_data.freezed.dart';
part 'hourly_data.g.dart';

@freezed
class HourlyData with _$HourlyData {
  const factory HourlyData({
    @Default("") String time,
    @Default(0) int temperature,
    @Default(0) int iconCode,
    @Default(0) int humidity,
    @Default(0) int precipitation,
  }) = _HourlyData;

  factory HourlyData.fromJson(Map<String, dynamic> json) =>
      _$HourlyDataFromJson(json);
}
