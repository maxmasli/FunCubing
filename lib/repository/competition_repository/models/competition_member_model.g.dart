// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompetitionMemberModel _$CompetitionMemberModelFromJson(
        Map<String, dynamic> json) =>
    CompetitionMemberModel(
      id: json['id'] as int,
      wcaId: CompetitionMemberModel._wcaIdFromJson(json['wca_id']),
      fcId: json['fc_id'] as String?,
      name: json['name'] as String,
      eventIds:
          (json['event_ids'] as List<dynamic>).map((e) => e as String).toList(),
    );
