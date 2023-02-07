import 'package:dartz/dartz.dart';
import 'package:funcubing/features/core/failure/failure.dart';
import 'package:funcubing/features/core/use_case/use_case.dart';
import 'package:funcubing/features/funcubing/domain/entities/competition_entity.dart';
import 'package:funcubing/features/funcubing/domain/repositories/fun_cubing_repository.dart';

class GetCompetitionsUseCase
    extends UseCase<List<CompetitionEntity>, NoParams> {
  FunCubingRepository funCubingRepository;

  GetCompetitionsUseCase({
    required this.funCubingRepository,
  });

  @override
  Future<Either<Failure, List<CompetitionEntity>>> call(NoParams params) async {
    return await funCubingRepository.getCompetitions();
  }
}
