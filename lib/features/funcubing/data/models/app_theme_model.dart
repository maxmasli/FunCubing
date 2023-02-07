import 'package:funcubing/features/funcubing/domain/entities/app_theme_entity.dart';

class AppThemeModel extends AppThemeEntity {
  const AppThemeModel({required super.isDark});

  factory AppThemeModel.fromEntity(AppThemeEntity appThemeEntity) {
    return AppThemeModel(isDark: appThemeEntity.isDark);
  }

}