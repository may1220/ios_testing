// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HourlyData _$$_HourlyDataFromJson(Map<String, dynamic> json) =>
    _$_HourlyData(
      time: json['time'] as String? ?? "",
      temperature: json['temperature'] as int? ?? 0,
      iconCode: json['iconCode'] as int? ?? 0,
      humidity: json['humidity'] as int? ?? 0,
      precipitation: json['precipitation'] as int? ?? 0,
    );

Map<String, dynamic> _$$_HourlyDataToJson(_$_HourlyData instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature': instance.temperature,
      'iconCode': instance.iconCode,
      'humidity': instance.humidity,
      'precipitation': instance.precipitation,
    };
