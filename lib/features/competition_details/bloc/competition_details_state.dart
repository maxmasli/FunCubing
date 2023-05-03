part of 'competition_details_bloc.dart';

abstract class CompetitionDetailsState extends Equatable {
  const CompetitionDetailsState();
}

class CompetitionDetailsLoading extends CompetitionDetailsState {
  @override
  List<Object> get props => [];
}

class CompetitionDetailsLoaded extends CompetitionDetailsState {
  final CompetitionDetailsModel competitionDetailsModel;
  final List<CompetitionEventModel> eventsList;
  final List<CompetitionMemberModel> membersList;
  final List<CompetitionResultModel> resultsList;

  const CompetitionDetailsLoaded({
    required this.competitionDetailsModel,
    required this.eventsList,
    required this.membersList,
    required this.resultsList,
  });

  //Map<String(String eventId : List<CompetitionResultModel> results)>
  Map<String, List<CompetitionResultModel>> get getResultsMap {
    final resultsMap = <String, List<CompetitionResultModel>>{};
    for (CompetitionResultModel resultModel in resultsList) {
      final eventName = getEventNameById(resultModel.eventId);
      if (resultsMap[eventName] == null) {
        resultsMap[eventName] = <CompetitionResultModel>[];
      }
      resultsMap[eventName]!.add(resultModel);
    }
    return resultsMap;
  }

  String getEventNameById(String id) {
    for (CompetitionEventModel eventModel in eventsList) {
      if (id == eventModel.id) {
        return "${eventModel.name} ${eventModel.round.getRound}";
      }
    }
    return "Null";
  }

  @override
  List<Object> get props => [
        competitionDetailsModel,
        eventsList,
        membersList,
        resultsList,
      ];
}

class CompetitionDetailsFailure extends CompetitionDetailsState {
  final Object? error;

  const CompetitionDetailsFailure(this.error);

  @override
  List<Object?> get props => [error];
}
