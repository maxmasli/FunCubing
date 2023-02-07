import 'package:dartz/dartz.dart';
import 'package:funcubing/features/core/failure/failure.dart';
import 'package:funcubing/features/core/use_case/use_case.dart';
import 'package:funcubing/features/funcubing/domain/entities/event_entity.dart';
import 'package:funcubing/features/funcubing/domain/repositories/fun_cubing_repository.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/get_competition_registrations_use_case.dart';

class GetCompetitionEventsUseCase
    extends UseCase<List<EventEntity>, QueryParams> {
  FunCubingRepository funCubingRepository;

  GetCompetitionEventsUseCase({
    required this.funCubingRepository,
  });

  @override
  Future<Either<Failure, List<EventEntity>>> call(QueryParams params) async {
    return await funCubingRepository.getCompetitionEvents(params.query);
  }
}
