import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'weather_data.freezed.dart';
part 'weather_data.g.dart';

@freezed
class WeatherData with _$WeatherData {
  const factory WeatherData({
    // @Default(null) DateTime date,
    @Default("") String date,
    //
    // OWMでも同様のもの
    // 階層化するとfirestoreにstoreするときに面倒そうなのでflatに定義しておく
    @Default(0) int weatherId,
    @Default("") String weatherMain,
    @Default("") String weatherDescription,
    @Default("") String weatherIcon,
    //
    // OWMだとmain.temp
    @Default(0) double temperature, // 気温
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}
