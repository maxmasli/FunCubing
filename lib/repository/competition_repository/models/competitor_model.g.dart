// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competitor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompetitorModel _$CompetitorModelFromJson(Map<String, dynamic> json) =>
    CompetitorModel(
      name: json['name'] as String,
      wcaId: CompetitorModel._wcaIdFromJson(json['wca_id']),
      fcId: json['fc_id'] as String,
      competitions: CompetitorModel._competitionsFromJson(json['competitions']),
      personalRecords:
          CompetitorModel._personalRecordsFromJson(json['personal_records']),
    );
