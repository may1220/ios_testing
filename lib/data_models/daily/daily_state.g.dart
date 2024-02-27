// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DailyState _$$_DailyStateFromJson(Map<String, dynamic> json) =>
    _$_DailyState(
      calendarDayTemperatureMax:
          (json['calendarDayTemperatureMax'] as List<dynamic>?)
              ?.map((e) => e as int?)
              .toList(),
      calendarDayTemperatureMin:
          (json['calendarDayTemperatureMin'] as List<dynamic>?)
              ?.map((e) => e as int?)
              .toList(),
      dayOfWeek: (json['dayOfWeek'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      expirationTimeUtc: (json['expirationTimeUtc'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      iconCode:
          (json['iconCode'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      moonPhase: (json['moonPhase'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      moonPhaseCode: (json['moonPhaseCode'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      moonPhaseDay: (json['moonPhaseDay'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      moonriseTimeLocal: (json['moonriseTimeLocal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      moonriseTimeUtc: (json['moonriseTimeUtc'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      moonsetTimeLocal: (json['moonsetTimeLocal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      moonsetTimeUtc: (json['moonsetTimeUtc'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      narrative: (json['narrative'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      qpf: (json['qpf'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      qpfSnow: (json['qpfSnow'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      sunriseTimeLocal: (json['sunriseTimeLocal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      sunriseTimeUtc: (json['sunriseTimeUtc'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      sunsetTimeLocal: (json['sunsetTimeLocal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      sunsetTimeUtc: (json['sunsetTimeUtc'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      temperatureMax: (json['temperatureMax'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      temperatureMin: (json['temperatureMin'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      validTimeLocal: (json['validTimeLocal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      validTimeUtc: (json['validTimeUtc'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      daypart: (json['daypart'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : DayPartState.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DailyStateToJson(_$_DailyState instance) =>
    <String, dynamic>{
      'calendarDayTemperatureMax': instance.calendarDayTemperatureMax,
      'calendarDayTemperatureMin': instance.calendarDayTemperatureMin,
      'dayOfWeek': instance.dayOfWeek,
      'expirationTimeUtc': instance.expirationTimeUtc,
      'iconCode': instance.iconCode,
      'moonPhase': instance.moonPhase,
      'moonPhaseCode': instance.moonPhaseCode,
      'moonPhaseDay': instance.moonPhaseDay,
      'moonriseTimeLocal': instance.moonriseTimeLocal,
      'moonriseTimeUtc': instance.moonriseTimeUtc,
      'moonsetTimeLocal': instance.moonsetTimeLocal,
      'moonsetTimeUtc': instance.moonsetTimeUtc,
      'narrative': instance.narrative,
      'qpf': instance.qpf,
      'qpfSnow': instance.qpfSnow,
      'sunriseTimeLocal': instance.sunriseTimeLocal,
      'sunriseTimeUtc': instance.sunriseTimeUtc,
      'sunsetTimeLocal': instance.sunsetTimeLocal,
      'sunsetTimeUtc': instance.sunsetTimeUtc,
      'temperatureMax': instance.temperatureMax,
      'temperatureMin': instance.temperatureMin,
      'validTimeLocal': instance.validTimeLocal,
      'validTimeUtc': instance.validTimeUtc,
      'daypart': instance.daypart,
    };
