// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_competition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberCompetitionModel _$MemberCompetitionModelFromJson(
        Map<String, dynamic> json) =>
    MemberCompetitionModel(
      competitorId: json['competitor_id'] as int,
      competitionId: json['competition_id'] as String,
      competitionName: json['competition_name'] as String,
      personalRecords: MemberCompetitionModel._personalRecordsFromJson(
          json['personal_records']),
    );
