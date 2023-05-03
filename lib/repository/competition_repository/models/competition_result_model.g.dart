// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompetitionResultModel _$CompetitionResultModelFromJson(
        Map<String, dynamic> json) =>
    CompetitionResultModel(
      id: json['id'] as int,
      eventId: json['event_id'] as String,
      round: json['round'] as int,
      position: json['pos'] as int,
      name: json['name'] as String,
      attempts:
          CompetitionResultModel._attemptsFromJson(json['attempts'] as List),
      best: CompetitionResultModel._bestFromJson(json['best']),
      average: json['average'] as int,
    );
