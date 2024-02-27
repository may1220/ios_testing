import 'package:ebhc/data_models/daily/daily_data.dart';
import 'package:ebhc/data_models/daily/daily_provider.dart';
import 'package:ebhc/data_models/firebase_firestore_site_weather_stream_provider.dart';
import 'package:ebhc/data_models/hourly/hourly_data.dart';
import 'package:ebhc/data_models/hourly/hourly_provider.dart';
import 'package:ebhc/views/pages/new_design/forecase_daily_cell_widget.dart';
import 'package:ebhc/views/pages/new_design/forecast_today_cell_widget.dart';
import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/pages/new_design/weather_icon.dart';
import 'package:ebhc/views/widget/app_rich_text.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data_models/user_state_provider.dart';

class WeatherPanel extends HookConsumerWidget {
  final String siteId;

  WeatherPanel({required this.siteId, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("User side Id ***** $siteId");
    // final userState = ref.watch(userStateProvider).value;
    final locationState = ref.watch(locationProvider(siteId));

    final hourlyDataState = ref.watch(hourlyStateProvider);
    final dailyDataState = ref.watch(dailyStateProvider);
    // TODO: parametize
    const address = null;
    int temperature = 0;
    const condition = 31;
    String currentAddress = "東京都港区六本木";

    List<int> dayOfWeekTemperature = [];
    List<String> dayOfWeekLabel = [];
    List<String> validTimeLocal = [];
    List<String> hourlyTimes = [];
    List<int> hourlyTemperatures = [];
    List<int> iconList = [];
    List<int> dailyIconList = [];
    int humidity = 0;
    int precipitation = 0;
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
              Row(
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
                    child: locationState.when(
                        data: (data) {
                          return FutureBuilder<String>(
                            future: data,
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const AppText(
                                  text: "東京都港区六本木",
                                  size: 16,
                                );
                              }
                              if (snapshot.hasData &&
                                  snapshot.connectionState ==
                                      ConnectionState.done) {
                                return AppText(
                                  text: snapshot.data!,
                                  size: 16,
                                  textAlign: TextAlign.start,
                                );
                              }
                              return const CircularProgressIndicator();
                            },
                          );
                        },
                        error: (err, stack) {
                          return Text("${err.toString()}");
                        },
                        loading: () => const Text("Loading")),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              /*  CurrentWeatherWidget(
                temperature: hourlyDataState.asData == null
                    ? 0
                    : hourlyDataState.asData!.value[0].temperature,
                humidity: hourlyDataState.asData == null
                    ? 0
                    : hourlyDataState.asData!.value[0].humidity,
                precipitation: hourlyDataState.asData == null
                    ? 0
                    : hourlyDataState.asData!.value[0].precipitation,
                condition: hourlyDataState.asData == null
                    ? 31
                    : hourlyDataState.asData!.value[0].iconCode,
              ), */
              const SizedBox(height: 16),
              // ForecastTodayWidget(
              //     hourlyTemperatures: hourlyTemperatures,
              //     hourlyTimes: hourlyTimes,
              //     icons: iconList,
              //     hourlyData: hourlyDataState.asData == null
              //         ? []
              //         : hourlyDataState.asData!.value),
            ],
          ),
          const SizedBox(height: 32),
          // WeatherForecastWidget(
          //     dayOfWeekLabel: dayOfWeekLabel,
          //     dayOfWeekTemperature: dayOfWeekTemperature,
          //     validTimeLocal: validTimeLocal,
          //     icons: dailyIconList,
          //     dailyData: dailyDataState.asData == null
          //         ? []
          //         : dailyDataState.asData!.value),
        ],
      ),
    );
  }
}

class CurrentWeatherWidget extends StatelessWidget {
  final int? temperature;

  final int? humidity;

  final double? precipitation;

  final int? condition;

  const CurrentWeatherWidget({
    this.temperature,
    this.humidity,
    this.precipitation,
    this.condition,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.rowBgColor,
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: WeatherIcon(
                    condition: condition ?? 31, size: WeatherIcon.sizeLarge),
              ),
              const SizedBox(width: 16),
              AppRichText(
                textOne: temperature!.toString(),
                colorOne: Colors.white,
                colorTwo: AppColors.labelColor,
              ),
            ],
          ),
          const SizedBox(width: 4),
          Container(
            width: 1,
            height: 37,
            color: const Color(0xffd6d7db),
          ),
          const SizedBox(width: 4),
          Row(
            children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  AppText(
                    text: "降水量",
                    // color: Color(0xff121315),
                    size: 16,
                  ),
                  AppText(
                    text: "湿度",
                    // color: Color(0xff121315),
                    size: 16,
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppRichText(
                    textOne: "${precipitation ?? "--"}",
                    colorOne: Colors.white,
                    colorTwo: AppColors.labelColor,
                    textTwo: " mm",
                    sizeOne: 18,
                  ),
                  AppRichText(
                    textOne: "${humidity ?? "--"} ",
                    textTwo: " %",
                    colorOne: Colors.white,
                    colorTwo: AppColors.labelColor,
                    sizeOne: 18,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ForecastTodayWidget extends StatelessWidget {
  final List<int?> temperatures;
  final List<String?> times;
  final List<int?> icons;

  const ForecastTodayWidget({
    required this.temperatures,
    required this.times,
    required this.icons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < temperatures.length; i++)
              ForecastTodayCellWidget(
                  temperature: temperatures[i]!,
                  time: times[i]!,
                  index: i,
                  icon: icons[i]!),
          ],
        ),
      ),
    );
  }
}

class WeatherForecastWidget extends StatelessWidget {
  List<String?> labels;
  List<int?> temperatures;
  List<String?> validTimeLocal;
  List<int?> icons;
  // List<String?> dayOrNight;
  WeatherForecastWidget(
      {super.key,
      required this.labels,
      required this.temperatures,
      required this.validTimeLocal,
      required this.icons});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText(
          text: "今後1週間の天気",
          size: 16,
        ),
        const SizedBox(height: 16),
        Container(
          width: MediaQuery.of(context).size.width,
          color: AppColors.rowBgColor,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 1; i < labels.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ForecastDailyCellWidget(
                        label: labels[i]!,
                        temperature: temperatures[i]!,
                        time: validTimeLocal[i]!,
                        icon: icons[i * 2]!), // these index are day icon arrays
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
