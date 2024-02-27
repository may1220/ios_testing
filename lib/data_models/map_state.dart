import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.freezed.dart';
// part 'map_state.g.dart';

// google map関連のstate (local)

const LatLng _defaultInitialPosition =
    LatLng(35.66479091421024, 139.73957332878268);

// 35.664573,139.7373739
@freezed
class MapState with _$MapState {
  const factory MapState({
    required LatLng initialPosition,
    @Default(_defaultInitialPosition) LatLng lastPosition,
    @Default({}) Set<Marker> markers,
  }) = _MapState;
  static const LatLng defaultInitialPosition = _defaultInitialPosition;
}
