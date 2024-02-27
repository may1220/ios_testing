import 'package:ebhc/data_models/daily/daily_data.dart';
import 'package:ebhc/data_models/daily/daily_repo.dart';
import 'package:ebhc/data_models/daily/daily_state.dart';
import 'package:ebhc/data_models/firebase_firestore_site_weather_stream_provider.dart';
import 'package:ebhc/data_models/location_address/location_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dailyDataProvider = FutureProvider.autoDispose<DailyState>((ref) async {
  final locationState = ref.watch(latLongStateProvider).value;
  LocationState location = const LocationState(lat: 0.0, lon: 0.0);
  if (locationState!.value != null) {
    location = locationState.value!;
  }
  DailyState ds = await ref.watch(dailyProvider).getDailyList(location);
  return ds;
});
/* 
final dailyStreamProvider = StreamProvider.autoDispose<List<DailyData>>((ref) =>
    Stream<List<DailyData>>.periodic(const Duration(seconds: 10), (int count) {
      final dailyState = ref.watch(dailyDataProvider); 

      List<DailyData> dailyDataList = [];
      /* if (dailyState.asData != null) { 
        List<String?> validLocalTime = dailyState.asData!.value.validTimeLocal!;
        List<int?> temperature =
            dailyState.asData!.value.calendarDayTemperatureMax!;
        List<String?> label = dailyState.asData!.value.dayOfWeek!;
        List<int?> iconCode = [];

        if (dailyState.asData!.value.daypart![0]!.iconCode!.isNotEmpty) {
          iconCode = dailyState.asData!.value.daypart![0]!.iconCode!;
        }

        if (validLocalTime.isNotEmpty) {
          for (int i = 1; i <= 7; i++) {
            dailyDataList.add(DailyData(
                time: validLocalTime[i]!,
                temperature: temperature[i]!,
                label: label[i]!,
                iconCode: iconCode[i * 2]!));
          }
        }
        if (kDebugMode) {
          print("Length of Daily Data ${dailyDataList.length}");
        }
      } else {
        if (kDebugMode) {
          print("Length of Daily Data null ${dailyDataList.length}");
        } */
      // }

      return dailyDataList;
    })); */

final currentDailyState = StateProvider<DailyState>((ref) => DailyState());

final dailyStateProvider =
    FutureProvider.autoDispose<List<DailyData>>((ref) async {
  final locationState = ref.watch(latLongStateProvider).value;
  LocationState location = const LocationState(lat: 0.0, lon: 0.0);
  if (locationState!.value != null) {
    location = locationState.value!;
  }
  List<DailyData> dailyDataList = [];
  DailyState dailyState = await ref.watch(dailyProvider).getDailyList(location);
  List<String?> validLocalTime = dailyState.validTimeLocal!;
  List<int?> temperature = dailyState.calendarDayTemperatureMax!;
  List<String?> label = dailyState.dayOfWeek!;
  List<int?> iconCode = [];
  if (dailyState.daypart![0]!.iconCode!.isNotEmpty) {
    iconCode = dailyState.daypart![0]!.iconCode!;
  }

  if (validLocalTime.isNotEmpty) {
    for (int i = 1; i <= 7; i++) {
      dailyDataList.add(DailyData(
          time: validLocalTime[i]!,
          temperature: temperature[i]!,
          label: label[i]!,
          iconCode: iconCode[i * 2]!));
    }
  }
  return dailyDataList;
});
