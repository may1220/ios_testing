import 'package:ebhc/data_models/daily/day_part_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_state.freezed.dart';
part 'daily_state.g.dart';

@freezed
class DailyState with _$DailyState {
  @JsonKey(includeIfNull: false)
  factory DailyState(
      {List<int?>? calendarDayTemperatureMax,
      List<int?>? calendarDayTemperatureMin,
      List<String?>? dayOfWeek,
      List<int?>? expirationTimeUtc,
      List<int?>? iconCode,
      List<String?>? moonPhase,
      List<String?>? moonPhaseCode,
      List<int?>? moonPhaseDay,
      List<String?>? moonriseTimeLocal,
      List<int?>? moonriseTimeUtc,
      List<String?>? moonsetTimeLocal,
      List<int?>? moonsetTimeUtc,
      List<String?>? narrative,
      List<double?>? qpf,
      List<double?>? qpfSnow,
      List<String?>? sunriseTimeLocal,
      List<int?>? sunriseTimeUtc,
      List<String?>? sunsetTimeLocal,
      List<int?>? sunsetTimeUtc,
      List<int?>? temperatureMax,
      List<int?>? temperatureMin,
      List<String?>? validTimeLocal,
      List<int?>? validTimeUtc,
      List<DayPartState?>? daypart}) = _DailyState;

  factory DailyState.fromJson(Map<String, dynamic> json) =>
      _$DailyStateFromJson(json);
}
