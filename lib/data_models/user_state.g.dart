// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserState _$$_UserStateFromJson(Map<String, dynamic> json) => _$_UserState(
      uId: json['uId'] as String? ?? "",
      gId: json['gId'] as String? ?? "",
      name: json['name'] as String? ?? "",
      siteId: json['siteId'] as String? ?? "",
      siteName: json['siteName'] as String? ?? "",
      isLeader: json['isLeader'] as bool? ?? false,
      isManager: json['isManager'] as bool? ?? false,
      totalAlerts: json['totalAlerts'] as int? ?? 0,
      unreadAlerts: json['unreadAlerts'] as int? ?? 0,
      workingStatus: json['workingStatus'] as String? ?? "",
    );

Map<String, dynamic> _$$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'uId': instance.uId,
      'gId': instance.gId,
      'name': instance.name,
      'siteId': instance.siteId,
      'siteName': instance.siteName,
      'isLeader': instance.isLeader,
      'isManager': instance.isManager,
      'totalAlerts': instance.totalAlerts,
      'unreadAlerts': instance.unreadAlerts,
      'workingStatus': instance.workingStatus,
    };
