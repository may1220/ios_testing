import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final isFirstLaunchProvider = FutureProvider<bool>((ref) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool? ifl = await sharedPreferences.getBool('isFirstLaunch');
  return ifl??true;
});

final makeFirstLaunchProvider = FutureProvider<bool>((ref) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setBool('isFirstLaunch', false);
  await ref.refresh(isFirstLaunchProvider);
  return true;
});