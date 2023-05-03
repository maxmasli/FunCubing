part of 'competitor_details_bloc.dart';

abstract class CompetitorDetailsEvent extends Equatable {
  const CompetitorDetailsEvent();
}

class CompetitorGetDetails extends CompetitorDetailsEvent {
  @override
  List<Object> get props => [];
}

