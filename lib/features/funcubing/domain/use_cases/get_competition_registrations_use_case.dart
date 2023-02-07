import 'package:dartz/dartz.dart';
import 'package:funcubing/features/core/failure/failure.dart';
import 'package:funcubing/features/core/use_case/use_case.dart';
import 'package:funcubing/features/funcubing/domain/entities/competitor_entity.dart';
import 'package:funcubing/features/funcubing/domain/repositories/fun_cubing_repository.dart';

class GetCompetitionRegistrationUseCase
    extends UseCase<List<CompetitorEntity>, QueryParams> {
  FunCubingRepository funCubingRepository;

  GetCompetitionRegistrationUseCase({
    required this.funCubingRepository,
  });

  @override
  Future<Either<Failure, List<CompetitorEntity>>> call(QueryParams params) async {
    return await funCubingRepository.getCompetitionRegistrations(params.query);
  }
}

class QueryParams {
  final String query;

  QueryParams(this.query);
}
