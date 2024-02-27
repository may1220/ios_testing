// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlertState _$$_AlertStateFromJson(Map<String, dynamic> json) =>
    _$_AlertState(
      docId: json['docId'] as String? ?? "",
      uId: json['uId'] as String? ?? "",
      gId: json['gId'] as String? ?? "",
      locationDeviceId: json['locationDeviceId'] as String? ?? "",
      messageId: json['messageId'] as int? ?? -1,
      uName: json['uName'] as String? ?? "",
      time: json['time'] as String? ?? "",
      type: json['type'] as int? ?? 0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      isOpen: json['isOpen'] as bool? ?? true,
    );

Map<String, dynamic> _$$_AlertStateToJson(_$_AlertState instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'uId': instance.uId,
      'gId': instance.gId,
      'locationDeviceId': instance.locationDeviceId,
      'messageId': instance.messageId,
      'uName': instance.uName,
      'time': instance.time,
      'type': instance.type,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isOpen': instance.isOpen,
    };
