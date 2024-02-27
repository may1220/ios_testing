// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HourlyState _$$_HourlyStateFromJson(Map<String, dynamic> json) =>
    _$_HourlyState(
      cloudCover: (json['cloudCover'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      dayOfWeek: (json['dayOfWeek'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      dayOrNight: (json['dayOrNight'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      expirationTimeUtc: (json['expirationTimeUtc'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      iconCode:
          (json['iconCode'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      iconCodeExtend: (json['iconCodeExtend'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      precipChance: (json['precipChance'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      precipType: (json['precipType'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      pressureMeanSeaLevel: (json['pressureMeanSeaLevel'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      qpf: (json['qpf'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      qpfSnow: (json['qpfSnow'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      relativeHumidity: (json['relativeHumidity'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      temperature: (json['temperature'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      temperatureDewPoint: (json['temperatureDewPoint'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      temperatureFeelsLike: (json['temperatureFeelsLike'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      temperatureHeatIndex: (json['temperatureHeatIndex'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      temperatureWindChill: (json['temperatureWindChill'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      uvDescription: (json['uvDescription'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      uvIndex:
          (json['uvIndex'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      validTimeLocal: (json['validTimeLocal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      validTimeUtc: (json['validTimeUtc'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      visibility: (json['visibility'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      windDirection: (json['windDirection'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      windDirectionCardinal: (json['windDirectionCardinal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      windGust:
          (json['windGust'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      windSpeed:
          (json['windSpeed'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      wxPhraseLong: (json['wxPhraseLong'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      wxPhraseShort: (json['wxPhraseShort'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      wxSeverity: (json['wxSeverity'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
    );

Map<String, dynamic> _$$_HourlyStateToJson(_$_HourlyState instance) =>
    <String, dynamic>{
      'cloudCover': instance.cloudCover,
      'dayOfWeek': instance.dayOfWeek,
      'dayOrNight': instance.dayOrNight,
      'expirationTimeUtc': instance.expirationTimeUtc,
      'iconCode': instance.iconCode,
      'iconCodeExtend': instance.iconCodeExtend,
      'precipChance': instance.precipChance,
      'precipType': instance.precipType,
      'pressureMeanSeaLevel': instance.pressureMeanSeaLevel,
      'qpf': instance.qpf,
      'qpfSnow': instance.qpfSnow,
      'relativeHumidity': instance.relativeHumidity,
      'temperature': instance.temperature,
      'temperatureDewPoint': instance.temperatureDewPoint,
      'temperatureFeelsLike': instance.temperatureFeelsLike,
      'temperatureHeatIndex': instance.temperatureHeatIndex,
      'temperatureWindChill': instance.temperatureWindChill,
      'uvDescription': instance.uvDescription,
      'uvIndex': instance.uvIndex,
      'validTimeLocal': instance.validTimeLocal,
      'validTimeUtc': instance.validTimeUtc,
      'visibility': instance.visibility,
      'windDirection': instance.windDirection,
      'windDirectionCardinal': instance.windDirectionCardinal,
      'windGust': instance.windGust,
      'windSpeed': instance.windSpeed,
      'wxPhraseLong': instance.wxPhraseLong,
      'wxPhraseShort': instance.wxPhraseShort,
      'wxSeverity': instance.wxSeverity,
    };
