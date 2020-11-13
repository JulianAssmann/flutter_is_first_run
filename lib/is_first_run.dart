library is_first_run;

import 'package:shared_preferences/shared_preferences.dart';

class IsFirstRun {
  static const _settingsKey = 'is_first_run';

  /// Returns true if this is the first time this function has been called
  /// since installing the app, otherwise false.
  static Future<bool> isFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstRun;
    try {
      firstRun = prefs.getBool(_settingsKey) ?? true;
    } on Exception {
      firstRun = true;
    }
    await prefs.setBool(_settingsKey, false);
    return firstRun;
  }

  /// Resets the plugin. The first call to [IsFirstRun.isFirstRun()] after calling this
  /// function will return true, subsequent calls will return false.
  static Future<void> reset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_settingsKey, null);
  }
}
