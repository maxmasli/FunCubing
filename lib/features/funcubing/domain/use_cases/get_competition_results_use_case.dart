import 'package:dartz/dartz.dart';
import 'package:funcubing/features/core/failure/failure.dart';
import 'package:funcubing/features/core/use_case/use_case.dart';
import 'package:funcubing/features/funcubing/domain/entities/result_entity.dart';
import 'package:funcubing/features/funcubing/domain/repositories/fun_cubing_repository.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/get_competition_registrations_use_case.dart';

class GetCompetitionResultsUseCase extends UseCase<List<ResultEntity>, QueryParams> {

  FunCubingRepository funCubingRepository;

  GetCompetitionResultsUseCase({
    required this.funCubingRepository,
  });

  @override
  Future<Either<Failure, List<ResultEntity>>> call(QueryParams params) async {
    return await funCubingRepository.getCompetitionResults(params.query);
  }

}