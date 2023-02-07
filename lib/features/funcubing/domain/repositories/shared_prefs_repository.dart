import 'package:dartz/dartz.dart';
import 'package:funcubing/features/core/failure/failure.dart';
import 'package:funcubing/features/funcubing/domain/entities/app_theme_entity.dart';

abstract class SharedPrefsRepository {
  Future<Either<Failure, AppThemeEntity>> getAppTheme();
  Future<Either<Failure, AppThemeEntity>> saveAppTheme(AppThemeEntity appThemeEntity);
}