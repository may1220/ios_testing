// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherData _$$_WeatherDataFromJson(Map<String, dynamic> json) =>
    _$_WeatherData(
      date: json['date'] as String? ?? "",
      weatherId: json['weatherId'] as int? ?? 0,
      weatherMain: json['weatherMain'] as String? ?? "",
      weatherDescription: json['weatherDescription'] as String? ?? "",
      weatherIcon: json['weatherIcon'] as String? ?? "",
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_WeatherDataToJson(_$_WeatherData instance) =>
    <String, dynamic>{
      'date': instance.date,
      'weatherId': instance.weatherId,
      'weatherMain': instance.weatherMain,
      'weatherDescription': instance.weatherDescription,
      'weatherIcon': instance.weatherIcon,
      'temperature': instance.temperature,
    };
