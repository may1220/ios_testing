import 'package:freezed_annotation/freezed_annotation.dart';

part 'hourly_state.freezed.dart';
part 'hourly_state.g.dart';

@freezed
class HourlyState with _$HourlyState {
  @JsonKey(includeIfNull: false)
  factory HourlyState(
      {List<int?>? cloudCover,
      List<String?>? dayOfWeek,
      List<String?>? dayOrNight,
      List<int?>? expirationTimeUtc,
      List<int?>? iconCode,
      List<int?>? iconCodeExtend,
      List<int?>? precipChance,
      List<String?>? precipType,
      List<double?>? pressureMeanSeaLevel,
      List<double?>? qpf,
      List<double?>? qpfSnow,
      List<int?>? relativeHumidity,
      List<int?>? temperature,
      List<int?>? temperatureDewPoint,
      List<int?>? temperatureFeelsLike,
      List<int?>? temperatureHeatIndex,
      List<int?>? temperatureWindChill,
      List<String?>? uvDescription,
      List<int?>? uvIndex,
      List<String?>? validTimeLocal,
      List<int?>? validTimeUtc,
      List<double?>? visibility,
      List<int?>? windDirection,
      List<String?>? windDirectionCardinal,
      List<int?>? windGust,
      List<int?>? windSpeed,
      List<String?>? wxPhraseLong,
      List<String?>? wxPhraseShort,
      List<int?>? wxSeverity}) = _HourlyState;

  factory HourlyState.fromJson(Map<String, dynamic> json) =>
      _$HourlyStateFromJson(json);
}
