import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const loginData = "login_data";

  static Future<bool> setData({String? key, dynamic value}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    return shp.setString(key!, value!);
  }

  static Future<String> getData({String? key}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    String? str = shp.getString(key!);
    return str ?? "";
  }
}
