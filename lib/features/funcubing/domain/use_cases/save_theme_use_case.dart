import 'package:dartz/dartz.dart';
import 'package:funcubing/features/core/failure/failure.dart';
import 'package:funcubing/features/core/use_case/use_case.dart';
import 'package:funcubing/features/funcubing/domain/entities/app_theme_entity.dart';
import 'package:funcubing/features/funcubing/domain/repositories/shared_prefs_repository.dart';

class SaveThemeUseCase extends UseCase<AppThemeEntity, ThemeParams> {

  final SharedPrefsRepository sharedPrefsRepository;

  SaveThemeUseCase({
    required this.sharedPrefsRepository,
  });

  @override
  Future<Either<Failure, AppThemeEntity>> call(ThemeParams params) async {
    return await sharedPrefsRepository.saveAppTheme(params.appThemeEntity);
  }
}


class ThemeParams {
  final AppThemeEntity appThemeEntity;

  ThemeParams(this.appThemeEntity);
}