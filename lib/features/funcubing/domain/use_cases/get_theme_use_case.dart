import 'package:dartz/dartz.dart';
import 'package:funcubing/features/core/failure/failure.dart';
import 'package:funcubing/features/core/use_case/use_case.dart';
import 'package:funcubing/features/funcubing/domain/entities/app_theme_entity.dart';
import 'package:funcubing/features/funcubing/domain/repositories/shared_prefs_repository.dart';

class GetThemeUseCase extends UseCase<AppThemeEntity, NoParams> {
  final SharedPrefsRepository sharedPrefsRepository;

  GetThemeUseCase({
    required this.sharedPrefsRepository,
  });

  @override
  Future<Either<Failure, AppThemeEntity>> call(NoParams params) async {
    return await sharedPrefsRepository.getAppTheme();
  }

}

