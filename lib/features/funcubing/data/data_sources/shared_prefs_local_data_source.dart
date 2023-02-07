import 'package:funcubing/features/funcubing/data/models/app_theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const themeKey = "THEME_KEY";

abstract class SharedPrefsLocalDataSource {
  Future<AppThemeModel> getAppTheme();
  Future<AppThemeModel> saveAppTheme(AppThemeModel appThemeModel);
}

class SharedPrefsLocalDataSourceImpl implements SharedPrefsLocalDataSource {

  final SharedPreferences sharedPreferences;

  const SharedPrefsLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<AppThemeModel> getAppTheme() async {
    final isDark = sharedPreferences.getBool(themeKey) ?? false;
    return Future.value(AppThemeModel(isDark: isDark));
  }

  @override
  Future<AppThemeModel> saveAppTheme(AppThemeModel appThemeModel) async {
    await sharedPreferences.setBool(themeKey, appThemeModel.isDark);
    return Future.value(appThemeModel);
  }
}