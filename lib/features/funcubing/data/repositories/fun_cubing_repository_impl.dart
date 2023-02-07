import 'package:dartz/dartz.dart';
import 'package:funcubing/features/core/errors/server_exception.dart';
import 'package:funcubing/features/core/failure/failure.dart';
import 'package:funcubing/features/core/failure/server_failure.dart';
import 'package:funcubing/features/funcubing/data/data_sources/fun_cubing_remote_data_source.dart';
import 'package:funcubing/features/funcubing/domain/entities/competition_entity.dart';
import 'package:funcubing/features/funcubing/domain/entities/competitor_entity.dart';
import 'package:funcubing/features/funcubing/domain/entities/event_entity.dart';
import 'package:funcubing/features/funcubing/domain/entities/result_entity.dart';
import 'package:funcubing/features/funcubing/domain/repositories/fun_cubing_repository.dart';

class FunCubingRepositoryImpl implements FunCubingRepository {

  FunCubingRemoteDataSource funCubingRemoteDataSource;

  FunCubingRepositoryImpl({
    required this.funCubingRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<CompetitionEntity>>> getCompetitions() async {
    try {
      final list = await funCubingRemoteDataSource.getCompetitions();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CompetitorEntity>>> getCompetitionRegistrations(String query) async {
    try {
      final list = await funCubingRemoteDataSource.getCompetitionRegistrations(query);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getCompetitionEvents(String query) async {
    try {
      final list = await funCubingRemoteDataSource.getCompetitionEvents(query);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ResultEntity>>> getCompetitionResults(String query) async {
    try {
      final list = await funCubingRemoteDataSource.getCompetitionResults(query);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}