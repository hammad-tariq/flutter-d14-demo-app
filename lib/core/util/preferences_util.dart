import 'package:shared_preferences/shared_preferences.dart';

import '../logger/app_logger.dart';

class PreferencesUtil {
  final SharedPreferences preferences;
  final AppLogger logger;

  PreferencesUtil({required this.preferences, required this.logger});

  /// GET DATA FROM Preferences
  getPreferencesData(String key) {
    return preferences.get(key) ?? "";
  }

  getBoolPreferencesData(String key) {
    return preferences.get(key) ?? false;
  }

  /// SAVE DATA in Preferences
  setPreferencesData(String key, String? value) {
    preferences.setString(key, value ?? "");
  }

  setBoolPreferencesData(String key, bool? value) {
    preferences.setBool(key, value ?? false);
  }

  // Clear preferences e.g. when user logs out or session time out.
  clearPreferencesData() async {
    await preferences.clear();
  }
}
