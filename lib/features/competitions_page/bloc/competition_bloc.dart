import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:funcubing/repository/competition_repository/abstract_comp_repository.dart';
import 'package:funcubing/repository/competition_repository/models/models.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'competition_event.dart';

part 'competition_state.dart';

class CompetitionBloc extends Bloc<CompetitionEvent, CompetitionState> {
  CompetitionBloc() : super(CompetitionLoading()) {
    on<CompetitionGetList>(_competitionGetList);
    on<CompetitionSearch>(_competitionSearch);
  }

  final repository = GetIt.I<AbstractCompetitionRepository>();

  Future<void> _competitionGetList(
      CompetitionGetList event, Emitter<CompetitionState> emit) async {
    emit(CompetitionLoading());
    final competitionList = await repository.getCompetitions();
    emit(CompetitionLoaded(
      competitionsList: competitionList,
      sortedCompetitionList: competitionList,
    ));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    GetIt.I<Talker>().handle(error, stackTrace);
    emit(CompetitionFailure(error));
    super.onError(error, stackTrace);
  }

  void _competitionSearch(
      CompetitionSearch event, Emitter<CompetitionState> emit) {
    if (state is! CompetitionLoaded) return;
    final loadedState = state as CompetitionLoaded;
    final query = event.query.trim();
    if (query.isEmpty) {
      emit(loadedState.copyWith(
          sortedCompetitionList: loadedState.competitionsList));
      return;
    }

    final sortedList = loadedState.competitionsList
        .where((element) =>
            element.name.toLowerCase().contains(query) ||
            (element.city != null && element.city!.toLowerCase().contains(query)))
        .toList();
    emit(loadedState.copyWith(sortedCompetitionList: sortedList));
  }
}
