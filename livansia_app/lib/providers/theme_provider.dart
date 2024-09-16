import '../helpers/imports.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  ThemeData themeData = ThemeData();
  ThemeData darkThemeData = ThemeData();

  Future<void> setThemeMode() async {
    var result = await (SharedPrefs.prefGet(StringPrefs.appTheme, true));

    if (result) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    return;
  }

  void changeTheme() {
    if (themeMode == ThemeMode.system) {
      themeMode = ThemeMode.system;
      SharedPrefs.prefSet(StringPrefs.appTheme, false);
    } else {
      if (themeMode == ThemeMode.light) {
        themeMode = ThemeMode.dark;
        SharedPrefs.prefSet(StringPrefs.appTheme, false);
      } else {
        themeMode = ThemeMode.light;
        SharedPrefs.prefSet(StringPrefs.appTheme, true);
      }
    }
    notifyListeners();
  }

//
}
