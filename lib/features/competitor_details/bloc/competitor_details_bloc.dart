import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:funcubing/repository/competition_repository/abstract_comp_repository.dart';
import 'package:funcubing/repository/competition_repository/models/competitor_model.dart';
import 'package:get_it/get_it.dart';

part 'competitor_details_event.dart';

part 'competitor_details_state.dart';

class CompetitorDetailsBloc
    extends Bloc<CompetitorDetailsEvent, CompetitorDetailsState> {
  CompetitorDetailsBloc({required this.fcId}) : super(CompetitorDetailsInitial()) {
    on<CompetitorGetDetails>(_competitorGetDetails);
  }

  final String fcId;

  final repository = GetIt.I<AbstractCompetitionRepository>();

  Future<void> _competitorGetDetails(
      CompetitorGetDetails event, Emitter<CompetitorDetailsState> emit) async {
    emit(CompetitorDetailsLoading());
    final competitorDetails = await repository.getCompetitor(fcId);
    emit(CompetitorDetailsLoaded(competitorDetails));
  }
}
