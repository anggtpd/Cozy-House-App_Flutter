import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme) {
    return ThemeData(
      // primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      secondaryHeaderColor:
          isDarkTheme ? const Color(0xff82868E) : const Color(0xE6FFFFFF),
      backgroundColor:
          isDarkTheme ? const Color(0xff252525) : Color(0xffF1F5FB),
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      // buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      errorColor: isDarkTheme ? Color(0xff5843BE) : Color(0xffb340ff),
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      // textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      primaryColorDark: isDarkTheme ? Colors.white : Colors.black,
    );
  }
}
