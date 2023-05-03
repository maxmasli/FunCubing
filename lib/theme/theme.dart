import 'package:flutter/material.dart';

ThemeData createLightTheme(bool isDark) {
  if (isDark) {
    return darkTheme();
  } else {
    return lightTheme();
  }
}

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
  );
}

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
  );
}
