import 'package:ebhc/data_models/weather_data.dart';
import 'package:ebhc/views/pages/new_design/weather_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayForecastData {
  final String hour;
  final int value;
  //  Widget icon;
  TodayForecastData({required this.hour, required this.value});

  factory TodayForecastData.fromWeatherData(WeatherData weatherData) {
    final now = DateTime.now(); // localtime
    final dt = DateTime.parse(weatherData.date).toLocal(); // utc->localtime
    final hour = (dt.hour == now.hour) ? "今" : dt.hour.toString();

    final value = weatherData.temperature.toInt();

    // TODO: sunny以外
    //  icon =
    //       WeatherIcon(condition: 31, size: WeatherIcon.sizeMedium);

    return TodayForecastData(
      hour: hour,
      value: value,
      // icon: icon,
    );
  }
}

class ForecastTodayCellWidget extends StatelessWidget {
  final String time;
  final int temperature;
  final int index;
  final int icon;

  const ForecastTodayCellWidget({
    required this.time,
    required this.temperature,
    required this.index,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String hour = time.substring(11, 13).toString();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // fix-me: 数字と"今"でheightが異なり表示ズレ
          // crossAxisAliment=baseline & textbaseline指定？
          // https://aakira.app/blog/2022/02/flutter-kerning/
          Text(
            hour.toString(), // day
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: WeatherIcon(
                condition: icon, size: WeatherIcon.sizeMedium), // size: 24
          ),
          const SizedBox(height: 16),
          Text(
            "$temperature℃", //temparetueru
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
