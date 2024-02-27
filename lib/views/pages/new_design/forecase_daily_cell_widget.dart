import 'package:ebhc/data_models/weather_data.dart';
import 'package:ebhc/views/pages/new_design/weather_icon.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:flutter/material.dart';

String toWeekdayString(int weekday) {
  if (weekday < 1 || weekday > 7) {
    // 例外
    return "";
  }
  return ["月", "火", "水", "木", "金", "土", "日"][weekday - 1];
}

DateTime getStartOfDay(DateTime dt) {
  final startOfDay = DateTime(dt.year, dt.month, dt.day);
  return startOfDay;
}

class DailyForecastData {
  final String day;
  final int value;
  // final Widget icon;
  DailyForecastData({required this.day, required this.value});

  factory DailyForecastData.fromWeatherData(WeatherData weatherData) {
    final now = getStartOfDay(DateTime.now()); // localtime
    final dt = getStartOfDay(
        DateTime.parse(weatherData.date).toLocal()); // utc->localtime

    final diffDays = dt.difference(now).inDays;
    // if (kDebugMode) {
    //   print("Daily: orig: ${weatherData.date} dt:$dt now:$now diff:$diffDays");
    // }
    final day =
        (diffDays == 1) ? "明日" : "${dt.day}日 (${toWeekdayString(dt.weekday)})";

    final value = weatherData.temperature.toInt();

    // TODO: sunny以外
    // const icon =
    //     WeatherIcon(condition: WeatherIcon.sunny, size: WeatherIcon.sizeMedium);

    return DailyForecastData(
      day: day,
      value: value,
      // icon: icon,
    );
  }
}

class ForecastDailyCellWidget extends StatelessWidget {
  String label;
  int temperature;
  String time;
  int icon;

  ForecastDailyCellWidget({
    required this.label,
    required this.temperature,
    required this.time,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) { 
    String day = time.substring(8, 10).toString();
    String dayLabel = label.substring(0, 1).toString(); 
    return Column( 
      children: [
        AppText(text: "$day日($dayLabel)", size: 16),
        const SizedBox(height: 16),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: WeatherIcon(condition: icon, size: WeatherIcon.sizeMedium),
        ),
        const SizedBox(height: 16),
        AppText(
          text: "$temperature℃",
          size: 16,
        ),
      ],
    );
  }
}
