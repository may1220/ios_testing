import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_state.freezed.dart';
part 'location_state.g.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    required double lat,
    required double lon,
  }) = _LocationState;
  factory LocationState.fromJson(Map<String, dynamic> json) =>
      _$LocationStateFromJson(json);
}
