import 'package:dartz/dartz.dart';
import 'package:funcubing/features/core/failure/failure.dart';
import 'package:funcubing/features/funcubing/data/data_sources/shared_prefs_local_data_source.dart';
import 'package:funcubing/features/funcubing/data/models/app_theme_model.dart';
import 'package:funcubing/features/funcubing/domain/entities/app_theme_entity.dart';
import 'package:funcubing/features/funcubing/domain/repositories/shared_prefs_repository.dart';

class SharedPrefsRepositoryImpl implements SharedPrefsRepository {
  SharedPrefsLocalDataSource sharedPrefsLocalDataSource;

  SharedPrefsRepositoryImpl({
    required this.sharedPrefsLocalDataSource,
  });

  @override
  Future<Either<Failure, AppThemeEntity>> getAppTheme() async {
    return Right(await sharedPrefsLocalDataSource.getAppTheme());
  }

  @override
  Future<Either<Failure, AppThemeEntity>> saveAppTheme(
      AppThemeEntity appThemeEntity) async {
    return Right(await sharedPrefsLocalDataSource
        .saveAppTheme(AppThemeModel.fromEntity(appThemeEntity)));
  }
}
