// ユーザー情報の受け渡しを行うためのProvider
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebhc/data_models/firestore_repository.dart';
import 'package:ebhc/data_models/location_address/location_state.dart';
import 'package:ebhc/data_models/user_state_provider.dart';
import 'package:ebhc/data_models/weather_state.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 一応サイト全体をsnapshotでstreamとして流す
final siteStreamProvider = StreamProvider.autoDispose
    .family<DocumentSnapshot<Map<String, dynamic>>, String>((ref, siteId) {
  final firestore = ref.read(firebaseFirestoreProvider);
  final snapshots = firestore.collection('sites').doc(siteId).snapshots();
  return snapshots;
});

// 天気予報だけを取りだす
final siteWeatherProvider = Provider.autoDispose
    .family<AsyncValue<WeatherState>, String>((ref, siteId) {
  final asyncAlertsQuery = ref.watch(siteStreamProvider(siteId));
  final weatherState = asyncAlertsQuery.whenData((snapshot) {
    final doc = snapshot.data()!;
    final weatherForecast = doc["weatherForecast"];
    final weather = WeatherState.fromJson(weatherForecast);
    return weather;
  });
  return weatherState;
});

final locationProvider = Provider.autoDispose
    .family<AsyncValue<Future<String>>, String>((ref, siteId) {
  final asyncAlertsQuery = ref.watch(siteStreamProvider(siteId));
  final locationState = asyncAlertsQuery.whenData((snapshot) async {
    final doc = snapshot.data()!;
    final weatherForecast = doc["location"];
    final location = LocationState.fromJson(weatherForecast);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.lat, location.lon);
    Placemark place = placemarks[0];

    String currentAddress =
        '${place.country},${place.thoroughfare} ${place.subThoroughfare}, ${place.subLocality},${place.locality},${place.administrativeArea} ${place.subAdministrativeArea} ${place.postalCode}';
    // ,${place.street},,${place.name}
    if (kDebugMode) {
      print("Address ######### ${place.toJson()}");
    }
    return currentAddress;
  });
  return locationState;
});

final latLongStateProvider =
    FutureProvider.autoDispose<AsyncValue<LocationState>>((ref) {
  final userState = ref.watch(userStateProvider).value;
  final siteId = (userState != null) ? userState.siteId : "";
  var latLongState = const AsyncValue.data(LocationState(lat: 0.0, lon: 0.0));
  if (siteId != "") {
    final asyncAlertsQuery = ref.watch(siteStreamProvider(siteId));
    latLongState = asyncAlertsQuery.whenData((snapshot) {
      final doc = snapshot.data()!;
      final locationData = doc["location"];
      final location = LocationState.fromJson(locationData);
      return location;
    });
  }
  return latLongState;
});
