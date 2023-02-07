import 'dart:convert';

import 'package:funcubing/features/core/errors/server_exception.dart';
import 'package:funcubing/features/funcubing/data/models/competition_model.dart';
import 'package:funcubing/features/funcubing/data/models/competitor_model.dart';
import 'package:funcubing/features/funcubing/data/models/event_model.dart';
import 'package:funcubing/features/funcubing/data/models/result_model.dart';
import 'package:http/http.dart' as http;

abstract class FunCubingRemoteDataSource {
  ///
  ///Calls https://funcubing.org/api/competitions?is_publish=true
  ///
  Future<List<CompetitionModel>> getCompetitions();

  ///
  /// Calls https://funcubing.org/api/competitions/$query/registrations
  ///
  Future<List<CompetitorModel>> getCompetitionRegistrations(String query);

  ///
  /// Calls https://funcubing.org/api/competitions/$query/events
  ///
  Future<List<EventModel>> getCompetitionEvents(String query);

  ///
  /// Calls https://funcubing.org/api/competitions/$query/results
  ///
  Future<List<ResultModel>> getCompetitionResults(String query);
}

class FunCubingRemoteDataSourceImpl extends FunCubingRemoteDataSource {
  final http.Client client;

  FunCubingRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<CompetitionModel>> getCompetitions() async {
    try {
      final url =
          Uri.parse("https://funcubing.org/api/competitions?is_publish=true");
      final response = await client.get(url);
      final List list = (jsonDecode(response.body) as List);
      return list.map((e) {
        return CompetitionModel.fromJson(e);
      }).toList();
    } catch (exception) {
      throw ServerException();
    }
  }

  @override
  Future<List<CompetitorModel>> getCompetitionRegistrations(
      String query) async {
    try {
      final url = Uri.parse(
          "https://funcubing.org/api/competitions/$query/registrations");
      final response = await client.get(url);
      final List list = (jsonDecode(response.body) as List);
      return list.map((e) {
        return CompetitorModel.fromJson(e);
      }).toList();
    } catch (exception) {
      throw ServerException();
    }
  }

  @override
  Future<List<EventModel>> getCompetitionEvents(String query) async {
    try {
      final url =
          Uri.parse('https://funcubing.org/api/competitions/$query/events');
      final response = await client.get(url);
      final List list = jsonDecode(response.body) as List;
      return list.map((e) => EventModel.fromJson(e)).toList();
    } catch (exception) {
      throw ServerException();
    }
  }

  @override
  Future<List<ResultModel>> getCompetitionResults(String query) async {
    try {
      final url =
      Uri.parse('https://funcubing.org/api/competitions/$query/results');
      final response = await client.get(url);
      final List list = jsonDecode(response.body) as List;
      return list.map((e) => ResultModel.fromJson(e)).toList();
    } catch (exception) {
      throw ServerException();
    }
  }
}
