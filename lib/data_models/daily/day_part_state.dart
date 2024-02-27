import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_part_state.freezed.dart';
part 'day_part_state.g.dart';

@freezed
class DayPartState with _$DayPartState {
  @JsonKey(includeIfNull: false)
  factory DayPartState({
    List<int?>? cloudCover,
    List<String?>? dayOrNight,
    List<String?>? daypartName,
    List<int?>? iconCode,
    List<int?>? iconCodeExtend,
    List<String?>? narrative,
    List<int?>? precipChance,
    List<String?>? precipType,
    List<double?>? qpf,
    List<double?>? qpfSnow,
    List<String?>? qualifierCode,
    List<String?>? qualifierPhrase,
    List<int?>? relativeHumidity,
    List<String?>? snowRange,
    List<int?>? temperature,
    List<int?>? temperatureHeatIndex,
    List<int?>? temperatureWindChill,
    List<String?>? thunderCategory,
    List<int?>? thunderIndex,
    List<String?>? uvDescription,
    List<int?>? uvIndex,
    List<int?>? windDirection,
    List<String?>? windDirectionCardinal,
    List<String?>? windPhrase,
    List<int?>? windSpeed,
    List<String?>? wxPhraseLong,
    List<String?>? wxPhraseShort,
  }) = _DayPartState;

  factory DayPartState.fromJson(Map<String, dynamic> json) =>
      _$DayPartStateFromJson(json);
}
