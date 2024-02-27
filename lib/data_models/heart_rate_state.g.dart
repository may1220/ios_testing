// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heart_rate_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HeartRateState _$$_HeartRateStateFromJson(Map<String, dynamic> json) =>
    _$_HeartRateState(
      heartRate: json['heartRate'] as int?,
      minHeartRate: json['minHeartRate'] as int? ?? 999,
      maxHeartRate: json['maxHeartRate'] as int? ?? 0,
      minTime: json['minTime'] as String? ?? "",
      maxTime: json['maxTime'] as String? ?? "",
      time: json['time'] as String?,
      isTime: json['isTime'] as bool? ?? false,
    );

Map<String, dynamic> _$$_HeartRateStateToJson(_$_HeartRateState instance) =>
    <String, dynamic>{
      'heartRate': instance.heartRate,
      'minHeartRate': instance.minHeartRate,
      'maxHeartRate': instance.maxHeartRate,
      'minTime': instance.minTime,
      'maxTime': instance.maxTime,
      'time': instance.time,
      'isTime': instance.isTime,
    };
