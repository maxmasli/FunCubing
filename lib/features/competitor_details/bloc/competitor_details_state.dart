part of 'competitor_details_bloc.dart';

abstract class CompetitorDetailsState extends Equatable {
  const CompetitorDetailsState();
}

class CompetitorDetailsInitial extends CompetitorDetailsState {
  @override
  List<Object> get props => [];
}

class CompetitorDetailsLoading extends CompetitorDetailsState {
  @override
  List<Object> get props => [];
}

class CompetitorDetailsLoaded extends CompetitorDetailsState {
  final CompetitorModel competitorModel;

  const CompetitorDetailsLoaded(this.competitorModel);

  @override
  List<Object> get props => [competitorModel];
}

class CompetitorDetailsFailure extends CompetitorDetailsState {
  final Object? error;

  const CompetitorDetailsFailure(this.error);

  @override
  List<Object?> get props => [error];
}
