import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:funcubing/features/core/use_case/use_case.dart';
import 'package:funcubing/features/funcubing/domain/entities/competition_entity.dart';
import 'package:funcubing/features/funcubing/domain/entities/competitor_entity.dart';
import 'package:funcubing/features/funcubing/domain/entities/event_entity.dart';
import 'package:funcubing/features/funcubing/domain/entities/result_entity.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/get_competition_events_use_case.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/get_competition_registrations_use_case.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/get_competition_results_use_case.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/get_competitions_use_case.dart';

part 'competitions_event.dart';

part 'competitions_state.dart';

class CompetitionsBloc extends Bloc<CompetitionsEvent, CompetitionsState> {
  final GetCompetitionsUseCase _getCompetitionsUseCase;
  final GetCompetitionRegistrationUseCase _getCompetitionRegistrationUseCase;
  final GetCompetitionEventsUseCase _getCompetitionEventsUseCase;
  final GetCompetitionResultsUseCase _getCompetitionResultsUseCase;

  CompetitionsBloc({
    required GetCompetitionsUseCase getCompetitionsUseCase,
    required GetCompetitionRegistrationUseCase
        getCompetitionRegistrationUseCase,
    required GetCompetitionEventsUseCase getCompetitionEventsUseCase,
    required GetCompetitionResultsUseCase getCompetitionResultsUseCase,
  })  : _getCompetitionsUseCase = getCompetitionsUseCase,
        _getCompetitionRegistrationUseCase = getCompetitionRegistrationUseCase,
        _getCompetitionEventsUseCase = getCompetitionEventsUseCase,
        _getCompetitionResultsUseCase = getCompetitionResultsUseCase,
        super(const CompetitionsState(
            competitionsList: [],
            currentCompetition: null,
            currentCompetitors: [],
            currentEvents: [],
            currentResults: {})) {
    on<CompetitionGetEvent>(_competitionGet);
    on<CompetitionGetDetailsEvent>(_competitionGetDetails);
    on<CompetitionGetRegistrationsEvent>(_competitionGetRegistrations);
    on<CompetitionGetEventsEvent>(_competitionGetEvents);
    on<CompetitionGetResultsEvent>(_competitionGetResults);
  }

  void _competitionGet(
      CompetitionGetEvent event, Emitter<CompetitionsState> emit) async {
    emit(state.copyWith(isLoading: true));
    final competitionsList = await _getCompetitionsUseCase(NoParams());
    competitionsList.fold(
      (l) => emit(state.copyWith(competitionsList: [
        const CompetitionEntity(
            isPublish: false, isRanked: false, isApproved: false, name: "ERROR")
      ])),
      (competitionsList) =>
          emit(state.copyWith(competitionsList: competitionsList)),
    );
  }

  void _competitionGetDetails(
      CompetitionGetDetailsEvent event, Emitter<CompetitionsState> emit) {
    emit(state.copyWith(
        currentCompetition: state.competitionsList[event.index]));
    add(CompetitionGetRegistrationsEvent());
    add(CompetitionGetEventsEvent());
    add(CompetitionGetResultsEvent());
  }

  void _competitionGetRegistrations(CompetitionGetRegistrationsEvent event,
      Emitter<CompetitionsState> emit) async {
    emit(state.copyWith(isLoading: true));
    final competitorsList = await _getCompetitionRegistrationUseCase(
        QueryParams(state.currentCompetition!.id!));
    competitorsList.fold(
      (l) => print("ERROR"),
      (competitorsList) =>
          emit(state.copyWith(currentCompetitors: competitorsList)),
    );
  }

  void _competitionGetEvents(
      CompetitionGetEventsEvent event, Emitter<CompetitionsState> emit) async {
    emit(state.copyWith(isLoading: true));
    final eventsList = await _getCompetitionEventsUseCase(
        QueryParams(state.currentCompetition!.id!));
    eventsList.fold(
      (l) => print("ERROR"),
      (eventsList) => emit(state.copyWith(currentEvents: eventsList)),
    );
  }

  void _competitionGetResults(
      CompetitionGetResultsEvent event, Emitter<CompetitionsState> emit) async {
    emit(state.copyWith(isLoading: true));
    final resultsList = await _getCompetitionResultsUseCase(
        QueryParams(state.currentCompetition!.id!));
    final resultsMap = <String, List<ResultEntity>>{};
    resultsList.fold(
      (l) => print("ERROR"),
      (resultList) {
        for (var element in resultList) {
          if (resultsMap[element.eventId!] == null) {
            resultsMap[element.eventId!] = <ResultEntity>[];
          }
          resultsMap[element.eventId!]!.add(element);
        }
      },
    );
    emit(state.copyWith(currentResults: resultsMap));
  }
}
