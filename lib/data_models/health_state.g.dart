// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HealthState _$$_HealthStateFromJson(Map<String, dynamic> json) =>
    _$_HealthState(
      uName: json['uName'] as String? ?? "",
      sName: json['sName'] as String? ?? "",
      time: json['time'] as String? ?? "",
      heartRate: json['heartRate'] as int?,
      heatstrokeLevel: json['heatstrokeLevel'] as int?,
      healthLevel: json['healthLevel'] as int?,
      templerature: (json['templerature'] as num?)?.toDouble() ?? 0.0,
      ralativeHumidity: (json['ralativeHumidity'] as num?)?.toDouble() ?? 0.0,
      wbgt: (json['wbgt'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_HealthStateToJson(_$_HealthState instance) =>
    <String, dynamic>{
      'uName': instance.uName,
      'sName': instance.sName,
      'time': instance.time,
      'heartRate': instance.heartRate,
      'heatstrokeLevel': instance.heatstrokeLevel,
      'healthLevel': instance.healthLevel,
      'templerature': instance.templerature,
      'ralativeHumidity': instance.ralativeHumidity,
      'wbgt': instance.wbgt,
    };
