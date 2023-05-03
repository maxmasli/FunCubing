part of 'competition_bloc.dart';

abstract class CompetitionState extends Equatable {
  const CompetitionState();
}

class CompetitionLoading extends CompetitionState {
  @override
  List<Object> get props => [];
}

class CompetitionLoaded extends CompetitionState {
  final List<CompetitionModel> competitionsList;
  final List<CompetitionModel> sortedCompetitionList;

  const CompetitionLoaded({
    required this.competitionsList,
    required this.sortedCompetitionList,
  });

  @override
  List<Object> get props => [competitionsList, sortedCompetitionList];

  CompetitionLoaded copyWith({
    List<CompetitionModel>? competitionsList,
    List<CompetitionModel>? sortedCompetitionList,
  }) {
    return CompetitionLoaded(
      competitionsList: competitionsList ?? this.competitionsList,
      sortedCompetitionList:
          sortedCompetitionList ?? this.sortedCompetitionList,
    );
  }
}

class CompetitionFailure extends CompetitionState {
  final Object? error;

  const CompetitionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
