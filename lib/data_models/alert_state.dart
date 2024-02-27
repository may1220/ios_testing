import 'package:freezed_annotation/freezed_annotation.dart';
part 'alert_state.freezed.dart';
part 'alert_state.g.dart';

// ひとまずfirestore上のentityそのままとする

@freezed
class AlertState with _$AlertState {
  const factory AlertState({
    @Default("") String docId, // alert docID
    @Default("") String uId, // alert docID
    @Default("") String gId, // alert docID
    @Default("") String locationDeviceId, // alert docID

    @Default(-1) int messageId, // リスクID
    @Default("") String uName, // SmartfitID
    //@Default(null) DateTime? time, // 発生日時
    @Default("") String time, // 発生日時
    @Default(0) int type, // アラート種別

    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(true) bool isOpen,
  }) = _AlertState;

  factory AlertState.fromJson(Map<String, dynamic> json) =>
      _$AlertStateFromJson(json);
}
