import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataController extends GetxController {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  // private (_Foo)
  bool _darkTheme = true;
  // global
  bool get darkTheme => _darkTheme;

  changeTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    update();
  }

  Future loadTheme() async {
    DarkThemePreference dt = DarkThemePreference();
    final newDt = await dt.getTheme();
    _darkTheme = newDt;
    update();
  }
}

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
