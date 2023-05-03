import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract class AbstractThemeSource {
  Future<bool> isDark();
  Future<void> saveTheme(bool isDark);
}

class ThemeSource implements AbstractThemeSource {

  final themeKey = "theme_key";

  final SharedPreferences sharedPreferences;

  const ThemeSource({
    required this.sharedPreferences,
  });

  @override
  Future<bool> isDark() async {
    final isDark = sharedPreferences.getBool(themeKey) ?? false;
    return isDark;
  }

  @override
  Future<void> saveTheme(bool isDark) async {
    await sharedPreferences.setBool(themeKey, isDark);
  }
}
