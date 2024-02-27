import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebhc/data_models/api/api_client.dart';
import 'package:ebhc/data_models/firebase_firestore_site_weather_stream_provider.dart';
import 'package:ebhc/data_models/hourly/hourly_state.dart';
import 'package:ebhc/data_models/location_address/location_state.dart';
import 'package:ebhc/data_models/user_state_provider.dart';
import 'package:ebhc/utils/app_constants.dart';
import 'package:ebhc/views/pages/new_design/weather_panel_widget.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

import '../../../data_models/daily/daily_state.dart';

class CustomWeatherPanel extends HookConsumerWidget {
  const CustomWeatherPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wpa = ref.watch(wpAddress);
    final hD = ref.watch(hourlyNotifierProvider);
    final dD = ref.watch(dailyNotifierProvider);

    /// if hD (hourlyData) is null, hD.isLoading will be true
    if (hD.isLoading || dD.isLoading) {
      customHourlyWeatherWidget(ref);
      ref.watch(customHourlyStream);
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                text: "現在の天気",
                size: 17,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 45,
                child: Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.near_me_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Expanded(
                      child: wpa.when(
                          data: (address) => AppText(
                                text: address,
                                size: 16,
                                textAlign: TextAlign.start,
                              ),
                          error: (o, s) => Container(),
                          loading: () => const AppText(
                                text: "東京都港区六本木",
                                size: 16,
                              )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              hD.when(
                  data: (data) => CurrentWeatherWidget(
                        temperature: data.temperature!.take(1).first,
                        humidity: data.relativeHumidity!.take(1).first,
                        precipitation: data.qpf!.take(1).first,
                        condition: data.iconCode!.take(1).first,
                      ),
                  error: (o, s) => Container(),
                  loading: () => Container()),
              const SizedBox(height: 16),
              hD.when(
                  data: (data) {
                    return ForecastTodayWidget(
                      icons: data.iconCode!.take(24).toList(),
                      temperatures: data.temperature!.take(24).toList(),
                      times: data.validTimeLocal!.take(24).toList(),
                    );
                  },
                  error: (o, s) => Container(),
                  loading: () => Container()),
            ],
          ),
          const SizedBox(height: 32),
          dD.when(
              data: (data) => WeatherForecastWidget(
                  labels: data.dayOfWeek!.take(8).toList(),
                  temperatures: data.calendarDayTemperatureMax!
                      .take(8)
                      .toList(), //dayOfWeekTemperature,
                  validTimeLocal: data.validTimeLocal!.take(8).toList(),
                  icons: data.daypart![0]!.iconCode!.take(16).toList()),
              error: (o, s) => Container(),
              loading: () => Container()),
        ],
      ),
    );
  }
}

final wpAddress = FutureProvider.autoDispose<String>((ref) async {
  final userState = await ref.watch(userStateProvider.future);
  if (userState == null) {
    return '';
  }
  final siteData = await ref.watch(siteStreamProvider(userState.siteId).future);
  final location = LocationState.fromJson(siteData.data()?['location']);
  List<Placemark> places = await placemarkFromCoordinates(location.lat, location.lon);
  Placemark place = places[0];

  String currentAddress = '${place.country},${place.thoroughfare} ${place.subThoroughfare}, ${place.subLocality},${place.locality},${place.administrativeArea} ${place.subAdministrativeArea} ${place.postalCode}';

  return currentAddress;
});

final customHourlyStream = StreamProvider.autoDispose((ref) {
  return Stream.periodic(const Duration(minutes: 1), (i) {
    final hD = ref.watch(hourlyNotifierProvider);
    if (hD.isLoading == false) {
      DateTime nowDt = DateTime.now();
      DateTime apiDt =
          DateTime.parse('${hD.value!.validTimeLocal!.first}').toLocal();
      if (DateTime(apiDt.year, apiDt.month, apiDt.day, apiDt.hour).isBefore(
          DateTime(nowDt.year, nowDt.month, nowDt.day, nowDt.hour, nowDt.minute,
              nowDt.second))) {
        customHourlyWeather(ref);
      }
    }else{
      customHourlyWeather(ref);
    }
  });
});

/// check required info to call api from timer
void customHourlyWeather(Ref ref) async {
  User? cU = FirebaseAuth.instance.currentUser;
  if(cU == null){
    return;
  }
  final userStateDoc = await FirebaseFirestore.instance.collection('users').doc(cU.uid).get();
  final siteDoc = await FirebaseFirestore.instance.collection('sites').doc(userStateDoc['siteId']).get();
  ref.read(hourlyNotifierProvider.notifier).fetchHourly(LocationState.fromJson(siteDoc['location']));
  ref.read(dailyNotifierProvider.notifier).fetchDaily(LocationState.fromJson(siteDoc['location']));
}

/// check required info to call api from ui
void customHourlyWeatherWidget(WidgetRef ref) async {
  User? cU = FirebaseAuth.instance.currentUser;
  if(cU == null){
    return;
  }
  final userStateDoc = await FirebaseFirestore.instance.collection('users').doc(cU.uid).get();
  final siteDoc = await FirebaseFirestore.instance.collection('sites').doc(userStateDoc['siteId']).get();
  ref.read(hourlyNotifierProvider.notifier).fetchHourly(LocationState.fromJson(siteDoc['location']));
  ref.read(dailyNotifierProvider.notifier).fetchDaily(LocationState.fromJson(siteDoc['location']));
}

final hourlyNotifierProvider = StateNotifierProvider.autoDispose<
        WeatherHourlyNotifier, AsyncValue<HourlyState>>(
    (ref) => WeatherHourlyNotifier(const AsyncValue.loading()));

final dailyNotifierProvider = StateNotifierProvider.autoDispose<
    WeatherDailyNotifier, AsyncValue<DailyState>>(
  (ref) => WeatherDailyNotifier(const AsyncValue.loading()),
);

class WeatherHourlyNotifier extends StateNotifier<AsyncValue<HourlyState>> {
  WeatherHourlyNotifier(AsyncValue<HourlyState> state) : super(state);

  fetchHourly(LocationState locationState) async {
    state = AsyncValue.data(await getWeatherData(locationState, AppConstants.HOURLY_URL));
  }

  resetState() {
    state = const AsyncValue.loading();
  }

  Future<HourlyState> getWeatherData(
      LocationState locationState, String url) async {
    final queryParameter = {
      "geocode": "${locationState.lat},${locationState.lon}",
      "format": "json",
      "units": "s",
      "language": "ja-JP",
      "apiKey": "0b12d3ca197640d892d3ca1976a0d86c"
    };
    Response response = await ApiClient.getData(url, queryParameter);
    if (response.statusCode == 200) {
      final HourlyState dailyState =
          HourlyState.fromJson(jsonDecode(response.body));
      return dailyState;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

class WeatherDailyNotifier extends StateNotifier<AsyncValue<DailyState>> {
  WeatherDailyNotifier(AsyncValue<DailyState> state) : super(state);

  fetchDaily(LocationState locationState) async {
    state = AsyncValue.data(
        await getWeatherData(locationState, AppConstants.DAILY_URL));
  }

  resetState() {
    state = const AsyncValue.loading();
  }

  Future<DailyState> getWeatherData(
      LocationState locationState, String url) async {
    final queryParameter = {
      "geocode": "${locationState.lat},${locationState.lon}",
      "format": "json",
      "units": "s",
      "language": "ja-JP",
      "apiKey": "0b12d3ca197640d892d3ca1976a0d86c"
    };
    Response response = await ApiClient.getData(url, queryParameter);
    if (response.statusCode == 200) {
      final DailyState dailyState =
          DailyState.fromJson(jsonDecode(response.body));
      return dailyState;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
