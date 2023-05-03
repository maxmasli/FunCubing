part of 'competition_bloc.dart';

abstract class CompetitionEvent extends Equatable {
  const CompetitionEvent();
}

class CompetitionGetList extends CompetitionEvent {
  @override
  List<Object?> get props => [];
}

class CompetitionSearch extends CompetitionEvent {
  final String query;

  const CompetitionSearch(this.query);

  @override
  List<Object> get props => [query];
}
