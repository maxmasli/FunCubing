part of 'competitions_bloc.dart';

class CompetitionsState extends Equatable {
  final List<CompetitionEntity> competitionsList;
  final CompetitionEntity? currentCompetition;
  final List<CompetitorEntity>? currentCompetitors;
  final bool isLoading;
  final List<EventEntity>? currentEvents;
  final Map<String, List<ResultEntity>>? currentResults;

  const CompetitionsState(
      {required this.competitionsList,
      required this.currentCompetition,
      required this.currentCompetitors,
      required this.currentEvents,
      required this.currentResults,
      this.isLoading = false});

  CompetitionsState copyWith({
    List<CompetitionEntity>? competitionsList,
    CompetitionEntity? currentCompetition,
    List<CompetitorEntity>? currentCompetitors,
    List<EventEntity>? currentEvents,
    Map<String, List<ResultEntity>>? currentResults,
    bool? isLoading,
  }) {
    return CompetitionsState(
      competitionsList: competitionsList ?? this.competitionsList,
      currentCompetition: currentCompetition ?? this.currentCompetition,
      currentCompetitors: currentCompetitors ?? this.currentCompetitors,
      currentEvents: currentEvents ?? this.currentEvents,
      currentResults: currentResults ?? this.currentResults,
      isLoading: isLoading ?? false,
    );
  }

  String getEventNameById(String id) {
    if (currentEvents == null) return "Null";
    for (EventEntity event in currentEvents!) {
      if (id == event.id) {
        if (event.round != null) {
          return "${event.name} ${event.round!.name}";
        } else {
          return event.name!;
        }
      }
    }
    return "Null";
  }

  @override
  List<Object?> get props => [
        competitionsList,
        currentCompetition,
        currentCompetitors,
        isLoading,
        currentEvents,
        currentResults,
      ];
}
