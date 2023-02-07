import 'package:dartz/dartz.dart';
import 'package:funcubing/features/core/failure/failure.dart';
import 'package:funcubing/features/funcubing/domain/entities/competition_entity.dart';
import 'package:funcubing/features/funcubing/domain/entities/competitor_entity.dart';
import 'package:funcubing/features/funcubing/domain/entities/event_entity.dart';
import 'package:funcubing/features/funcubing/domain/entities/result_entity.dart';

abstract class FunCubingRepository {
  Future<Either<Failure, List<CompetitionEntity>>> getCompetitions();
  Future<Either<Failure, List<CompetitorEntity>>> getCompetitionRegistrations(String query);
  Future<Either<Failure, List<EventEntity>>> getCompetitionEvents(String query);
  Future<Either<Failure, List<ResultEntity>>> getCompetitionResults(String query);
}