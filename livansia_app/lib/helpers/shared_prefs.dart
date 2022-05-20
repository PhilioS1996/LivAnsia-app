import 'package:livansia_app/helpers/imports.dart';

class SharedPrefs {
  late bool check;

  ///Get shared preferences with default value
  static Future<dynamic> prefGet(String key, [dynamic defaultValue]) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (!pref.containsKey(key)) {
      return defaultValue;
    }
    return pref.get(key);
  }

  ///Set any shared preferences
  static void prefSet(String key, dynamic value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (value is int) {
      await pref.setInt(key, value);
    } else if (value is String) {
      await pref.setString(key, value);
    } else if (value is double) {
      await pref.setDouble(key, value);
    } else if (value is bool) {
      await pref.setBool(key, value);
    } else if (value is List<String>) {
      await pref.setStringList(key, value);
    }
  }

  static void prefSetInt(String key, int value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt(key, value);
  }
}

class StringPrefs {
  static const String settingsPassword = 'settings_password';
  static const String appTheme =
      'app_theme'; // true if day, false if night mode
}
