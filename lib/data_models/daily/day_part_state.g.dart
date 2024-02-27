// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_part_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DayPartState _$$_DayPartStateFromJson(Map<String, dynamic> json) =>
    _$_DayPartState(
      cloudCover: (json['cloudCover'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      dayOrNight: (json['dayOrNight'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      daypartName: (json['daypartName'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      iconCode:
          (json['iconCode'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      iconCodeExtend: (json['iconCodeExtend'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      narrative: (json['narrative'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      precipChance: (json['precipChance'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      precipType: (json['precipType'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      qpf: (json['qpf'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      qpfSnow: (json['qpfSnow'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      qualifierCode: (json['qualifierCode'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      qualifierPhrase: (json['qualifierPhrase'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      relativeHumidity: (json['relativeHumidity'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      snowRange: (json['snowRange'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      temperature: (json['temperature'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      temperatureHeatIndex: (json['temperatureHeatIndex'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      temperatureWindChill: (json['temperatureWindChill'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      thunderCategory: (json['thunderCategory'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      thunderIndex: (json['thunderIndex'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      uvDescription: (json['uvDescription'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      uvIndex:
          (json['uvIndex'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      windDirection: (json['windDirection'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      windDirectionCardinal: (json['windDirectionCardinal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      windPhrase: (json['windPhrase'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      windSpeed:
          (json['windSpeed'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      wxPhraseLong: (json['wxPhraseLong'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      wxPhraseShort: (json['wxPhraseShort'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$$_DayPartStateToJson(_$_DayPartState instance) =>
    <String, dynamic>{
      'cloudCover': instance.cloudCover,
      'dayOrNight': instance.dayOrNight,
      'daypartName': instance.daypartName,
      'iconCode': instance.iconCode,
      'iconCodeExtend': instance.iconCodeExtend,
      'narrative': instance.narrative,
      'precipChance': instance.precipChance,
      'precipType': instance.precipType,
      'qpf': instance.qpf,
      'qpfSnow': instance.qpfSnow,
      'qualifierCode': instance.qualifierCode,
      'qualifierPhrase': instance.qualifierPhrase,
      'relativeHumidity': instance.relativeHumidity,
      'snowRange': instance.snowRange,
      'temperature': instance.temperature,
      'temperatureHeatIndex': instance.temperatureHeatIndex,
      'temperatureWindChill': instance.temperatureWindChill,
      'thunderCategory': instance.thunderCategory,
      'thunderIndex': instance.thunderIndex,
      'uvDescription': instance.uvDescription,
      'uvIndex': instance.uvIndex,
      'windDirection': instance.windDirection,
      'windDirectionCardinal': instance.windDirectionCardinal,
      'windPhrase': instance.windPhrase,
      'windSpeed': instance.windSpeed,
      'wxPhraseLong': instance.wxPhraseLong,
      'wxPhraseShort': instance.wxPhraseShort,
    };
