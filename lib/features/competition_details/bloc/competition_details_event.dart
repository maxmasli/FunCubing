part of 'competition_details_bloc.dart';

abstract class CompetitionDetailsEvent extends Equatable {
  const CompetitionDetailsEvent();
}

class GetCompetitionDetails extends CompetitionDetailsEvent {
  @override
  List<Object> get props => [];
}

class GetCompetitorDetails extends CompetitionDetailsEvent {
  @override
  List<Object> get props => [];
}

