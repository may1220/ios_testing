import 'dart:async';

import 'package:ebhc/data_models/map_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mapStateProvider = StateNotifierProvider<MapStateProvider, MapState>(
    (_) => MapStateProvider());

class MapStateProvider extends StateNotifier<MapState> {
  MapStateProvider() : super(const MapState(initialPosition: initialPosition));

  static const initialPosition = MapState.defaultInitialPosition;
  late Completer<GoogleMapController> googleMapController;
  final Set<Marker> _markers = {};

  void initState() {
    googleMapController = Completer();
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController.complete(controller);
  }

  void onCameraMove(CameraPosition position) {
    state = state.copyWith(lastPosition: position.target);
    state = state.copyWith(lastPosition: position.target);
  }

  void setPosition({required double latitude, required double longitude}) {
    state = state.copyWith(lastPosition: LatLng(latitude, longitude));
  }

  void addMarker() {
    _markers.add(Marker(
        markerId: MarkerId(state.lastPosition.toString()),
        position: state.lastPosition,
        infoWindow:
            const InfoWindow(title: 'Remember Here', snippet: 'good place'),
        icon: BitmapDescriptor.defaultMarker));
    state = state.copyWith(markers: _markers);
  }
}
