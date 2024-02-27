import 'dart:async';

import 'package:ebhc/data_models/firebase_firestore_site_weather_stream_provider.dart';
import 'package:ebhc/data_models/hourly/hourly_data.dart';
import 'package:ebhc/data_models/hourly/hourly_repo.dart';
import 'package:ebhc/data_models/hourly/hourly_state.dart';
import 'package:ebhc/data_models/location_address/location_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final hourlyDataProvider = FutureProvider.autoDispose<HourlyState>((ref) async {
  final locationState = ref.watch(latLongStateProvider).value;
  LocationState location = const LocationState(lat: 0.0, lon: 0.0);
  if (locationState!.value != null) {
    print("Location Latitude Longitude ${locationState.value}");
    location = locationState.value!;
  }
  HourlyState hourlyState =
      await ref.watch(hourlyProvider).getHourlyList(location);
  return hourlyState;
});

final todayWeatherProvider =
    StateProvider.autoDispose<Map<String, dynamic>>((ref) {
  final hourlyData = ref.watch(hourlyDataProvider).value;
  Map<String, dynamic> currentWeather = {
    "temperature": 0,
    "humidity": 0,
    "precipitation": 0
  };

  if (hourlyData != null) {
    // print(
    //     "Auto Streaming ? **************************${hourlyData.precipChance![0]!} Humidity ${hourlyData.relativeHumidity![0]!}");
    currentWeather["temperature"] = hourlyData.temperature![0]!;
    currentWeather["humidity"] = hourlyData.relativeHumidity![0]!;
    currentWeather["precipitation"] = hourlyData.precipChance![0]!;
  }
  return currentWeather;
});

final hourlyStreamProvider = StreamProvider.autoDispose<List<HourlyData>>(
    (ref) => Stream<List<HourlyData>>.periodic(const Duration(seconds: 60),
            (int count) {
          List<HourlyData> hourlyDataList = [];
          final hourlyData = ref.watch(hourlyStateProvider.future);

          hourlyData.then((value) {
            for (HourlyData hourly in value) {
              hourlyDataList.add(HourlyData(
                  temperature: hourly.temperature,
                  iconCode: hourly.iconCode,
                  time: hourly.time));
            }
          });
          return hourlyDataList;
        }));

final currentHourlyState = StateProvider<HourlyState>((ref) => HourlyState());

final hourlyStateProvider =
    FutureProvider.autoDispose<List<HourlyData>>((ref) async {
  final locationState = ref.watch(latLongStateProvider).value;
  LocationState location = const LocationState(lat: 0.0, lon: 0.0);
  if (locationState!.value != null) {
    print("Location Latitude Longitude ${locationState.value}");
    location = locationState.value!;
  }
  List<HourlyData> hourlyDataList = [];
  HourlyState hourlyState =
      await ref.watch(hourlyProvider).getHourlyList(location);
  List<String?> validLocalTime = hourlyState.validTimeLocal!;
  List<int?> temperature = hourlyState.temperature!;
  List<int?> iconCode = hourlyState.iconCode!;
  List<int?> relativeHumidity = hourlyState.relativeHumidity!;
  List<int?> precipitation = hourlyState.precipChance!;

  if (validLocalTime.isNotEmpty) {
    for (int i = 0; i <= 23; i++) {
      hourlyDataList.add(HourlyData(
          time: validLocalTime[i]!,
          temperature: temperature[i]!,
          iconCode: iconCode[i]!,
          humidity: relativeHumidity[i]!,
          precipitation: precipitation[i]!));
    }
  }
  return hourlyDataList;
});

// final hourlyStreamProvider = StateProvider.autoDispose((ref) {});
