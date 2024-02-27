// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DailyData _$$_DailyDataFromJson(Map<String, dynamic> json) => _$_DailyData(
      time: json['time'] as String? ?? "",
      label: json['label'] as String? ?? "",
      temperature: json['temperature'] as int? ?? 0,
      iconCode: json['iconCode'] as int? ?? 0,
    );

Map<String, dynamic> _$$_DailyDataToJson(_$_DailyData instance) =>
    <String, dynamic>{
      'time': instance.time,
      'label': instance.label,
      'temperature': instance.temperature,
      'iconCode': instance.iconCode,
    };
