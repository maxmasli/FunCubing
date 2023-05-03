import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/repository/competition_repository/abstract_comp_repository.dart';
import 'package:funcubing/repository/competition_repository/models/models.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'competition_details_event.dart';

part 'competition_details_state.dart';

class CompetitionDetailsBloc
    extends Bloc<CompetitionDetailsEvent, CompetitionDetailsState> {
  CompetitionDetailsBloc({required this.id})
      : super(CompetitionDetailsLoading()) {
    on<GetCompetitionDetails>(_getCompetitionDetails);
    on<GetCompetitorDetails>(_getCompetitorDetails);
  }

  final String id;

  final repository = GetIt.I<AbstractCompetitionRepository>();

  Future<void> _getCompetitionDetails(GetCompetitionDetails event,
      Emitter<CompetitionDetailsState> emit) async {
    emit(CompetitionDetailsLoading());
    final competitionDetails = await repository.getCompetitionDetails(id);
    final competitionEvents = await repository.getCompetitionEvents(id);
    final competitionMembers = await repository.getCompetitionMembers(id);
    final competitionResults = await repository.getCompetitionResults(id);

    emit(CompetitionDetailsLoaded(
      competitionDetailsModel: competitionDetails,
      eventsList: competitionEvents,
      membersList: competitionMembers,
      resultsList: competitionResults,
    ));
  }

  Future<void> _getCompetitorDetails(
      GetCompetitorDetails event, Emitter<CompetitionDetailsState> emit) async {
    final a = await repository.getCompetitor("MB03");
  }
  
  @override
  void onError(Object error, StackTrace stackTrace) {
    GetIt.I<Talker>().handle(error, stackTrace);
    emit(CompetitionDetailsFailure(error));
    super.onError(error, stackTrace);
  }


}
