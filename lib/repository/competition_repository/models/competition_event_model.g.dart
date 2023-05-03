// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompetitionEventModel _$CompetitionEventModelFromJson(
        Map<String, dynamic> json) =>
    CompetitionEventModel(
      id: json['id'] as String,
      name: json['name'] as String,
      round: RoundModel.fromJson(json['round'] as Map<String, dynamic>),
      format: json['format'] as String,
      cutoff: json['cutoff'] as String?,
      limit: json['time_limit'] as String?,
      advanceToNextRoundModel: json['advance_to_next_round'] == null
          ? null
          : AdvanceToNextRoundModel.fromJson(
              json['advance_to_next_round'] as Map<String, dynamic>),
    );
