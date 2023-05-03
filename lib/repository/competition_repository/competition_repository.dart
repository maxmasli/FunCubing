import 'package:dio/dio.dart';
import 'package:funcubing/repository/competition_repository/abstract_comp_repository.dart';
import 'package:funcubing/repository/competition_repository/models/competition_details_model.dart';
import 'package:funcubing/repository/competition_repository/models/competition_event_model.dart';
import 'package:funcubing/repository/competition_repository/models/competition_member_model.dart';
import 'package:funcubing/repository/competition_repository/models/competition_model.dart';
import 'package:funcubing/repository/competition_repository/models/competition_result_model.dart';
import 'package:funcubing/repository/competition_repository/models/competitor_model.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CompetitionRepository implements AbstractCompetitionRepository {
  final Dio dio;

  CompetitionRepository(this.dio);

  @override
  Future<List<CompetitionModel>> getCompetitions() async {
    final response =
        await dio.get('https://funcubing.org/api/competitions?is_publish=true');
    final jsonList = response.data as List;
    final competitionList = jsonList
        .map((e) => CompetitionModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return competitionList;
  }

  @override
  Future<CompetitionDetailsModel> getCompetitionDetails(String id) async {
    final response =
        await dio.get('https://funcubing.org/api/competitions/$id');

    return CompetitionDetailsModel.fromJson(response.data);
  }

  @override
  Future<List<CompetitionEventModel>> getCompetitionEvents(String id) async {
    final response =
        await dio.get('https://funcubing.org/api/competitions/$id/events');
    final jsonList = response.data as List;
    final competitionEventsList = jsonList
        .map((e) => CompetitionEventModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return competitionEventsList;
  }

  @override
  Future<List<CompetitionMemberModel>> getCompetitionMembers(String id) async {
    final response = await dio
        .get('https://funcubing.org/api/competitions/$id/registrations');
    final jsonList = response.data as List;
    final competitionMembersList = jsonList
        .map((e) => CompetitionMemberModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return competitionMembersList;
  }

  @override
  Future<List<CompetitionResultModel>> getCompetitionResults(String id) async {
    final response =
        await dio.get('https://funcubing.org/api/competitions/$id/results');
    final jsonList = response.data as List;
    final competitionResultsList =
        jsonList.map((e) => CompetitionResultModel.fromJson(e)).toList();

    return competitionResultsList;
  }

  @override
  Future<CompetitorModel> getCompetitor(String fcId) async {
    final response =
        await dio.get('https://funcubing.org/api/competitors/$fcId');
    final json = (response.data as List)[0];
    final competitor = CompetitorModel.fromJson(json);
    print(competitor);
    return competitor;
  }
}
