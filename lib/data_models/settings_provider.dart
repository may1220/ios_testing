import 'package:ebhc/data_models/settings_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsStateProvider =
    StateNotifierProvider<SettingsStateNotifier, SettingsState>((ref) {
  return SettingsStateNotifier(ref);
});

class SettingsStateNotifier extends StateNotifier<SettingsState> {
  SettingsStateNotifier(this.ref) : super(const SettingsState()) {
    () async {
      _prefs = await SharedPreferences.getInstance();
      final isEasy = _prefs.getBool(isEasyPrefsKey);
      if (isEasy != null) {
        state = state.copyWith(isEasyView: isEasy);
      }
    }();
  }

  /// SharedPreferences で使用するテーマ保存用のキー
  static const isEasyPrefsKey = 'settings';

  // `Reader` で他のProviderを読み込むことが無いなら削除しても良い
  // ignore: unused_field
  final Ref ref;

  late SharedPreferences _prefs;

  Future changeAndSave(viewMode) async {
    final vm = viewMode == "easy" ? "EASY" : "MODERN";
    final isEasy = (vm == "EASY");
    state = state.copyWith(isEasyView: isEasy);
    await _save();
  }

  /// 選択したテーマを`SharedPreferences` で保存
  Future<void> _save() async {
    await _prefs.setBool(isEasyPrefsKey, state.isEasyView);
  }
}
