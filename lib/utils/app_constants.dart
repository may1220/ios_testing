class AppConstants {
  static const String BASE_URL = "api.weather.com";
  static const String DAILY_URL = "/v3/wx/forecast/daily/10day";
  static const String HOURLY_URL = "/v3/wx/forecast/hourly/2day";

  static const Duration timeGap = Duration(minutes: 5); //smartfit's timestamp is fetch by 5 minutes
  static const double latitude = 35.68124356294639;
  static const double longitude = 139.76712250819668;

}
