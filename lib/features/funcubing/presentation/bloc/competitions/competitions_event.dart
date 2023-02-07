part of 'competitions_bloc.dart';

abstract class CompetitionsEvent extends Equatable {
  const CompetitionsEvent();
}

class CompetitionGetEvent extends CompetitionsEvent {
  @override
  List<Object> get props => [];
}

class CompetitionGetDetailsEvent extends CompetitionsEvent {
  final int index;

  const CompetitionGetDetailsEvent(this.index);

  @override
  List<Object> get props => [index];
}

class CompetitionGetRegistrationsEvent extends CompetitionsEvent {
  @override
  List<Object> get props => [];
}

class CompetitionGetEventsEvent extends CompetitionsEvent {
  @override
  List<Object> get props => [];
}

class CompetitionGetResultsEvent extends CompetitionsEvent {
  @override
  List<Object> get props => [];
}