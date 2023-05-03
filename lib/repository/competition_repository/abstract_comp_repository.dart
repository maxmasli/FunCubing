import 'package:funcubing/repository/competition_repository/models/competitor_model.dart';
import 'package:funcubing/repository/competition_repository/models/models.dart';

abstract class AbstractCompetitionRepository {
  ///
  /// Calls https://funcubing.org/api/competitions?is_publish=true
  ///
  Future<List<CompetitionModel>> getCompetitions();

  ///
  /// Calls https://funcubing.org/api/competitions/{id}
  ///
  Future<CompetitionDetailsModel> getCompetitionDetails(String id);

  ///
  /// Calls https://funcubing.org/api/competitions/{id}/events
  ///
  Future<List<CompetitionEventModel>> getCompetitionEvents(String id);

  ///
  /// Calls https://funcubing.org/api/competitions/{id}/registrations
  ///
  Future<List<CompetitionMemberModel>> getCompetitionMembers(String id);

  ///
  /// Calls https://funcubing.org/api/competitions/{id}/results
  ///
  Future<List<CompetitionResultModel>> getCompetitionResults(String id);

  ///
  /// Calls https://funcubing.org/api/competitors/{fc_id}
  ///
  Future<CompetitorModel> getCompetitor(String fcId);
}