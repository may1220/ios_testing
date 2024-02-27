// users/{uid}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

//EBHCID, u_name,s_name, uid, gid

// uidに対するRoleはcustom claimで処理する？

// @freezed
// class Ids with _$Ids {
//   const factory Ids({
//     // Smartfit ids
//     @Default("") String uName,
//     @Default("") String gName,
//   }) = _Ids;

//   factory Ids.fromJson(Map<String, dynamic> json) => _$IdsFromJson(json);
// }

// @freezed
// class WorkingStatus with _$WorkingStatus {
//   const factory WorkingStatus({
//     @Default(false) bool isWorking, // Add your fields here
//   }) = _WorkingStatus;

//   factory WorkingStatus.fromJson(Map<String, dynamic> json) =>
//       _$WorkingStatusFromJson(json);
// }

// @freezed
// class FcmToken with _$FcmToken {
//   const factory FcmToken({
//     @Default("") String fcmToken, // Add your fields here
//   }) = _FcmToken;

//   factory FcmToken.fromJson(Map<String, dynamic> json) =>
//       _$FcmTokenFromJson(json);
// }

@freezed
class UserState with _$UserState {
  @JsonSerializable(explicitToJson: true)
  const factory UserState({
    @Default("") String uId,
    @Default("") String gId,
    @Default("") String name,
    @Default("") String siteId,
    @Default("") String siteName,
    @Default(false) bool isLeader,
    @Default(false) bool isManager,
    @Default(0) int totalAlerts,
    @Default(0) int unreadAlerts,
    @Default("") String workingStatus,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}
