// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompetitionDetailsModel _$CompetitionDetailsModelFromJson(
        Map<String, dynamic> json) =>
    CompetitionDetailsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      city: json['city'] as String?,
      site: json['website'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      logoUrl: json['logo'] as String,
      description: json['details'] as String?,
      organizers: (json['organizers'] as List<dynamic>)
          .map((e) => OrganizerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      competitorsCount: CompetitionDetailsModel._competitorsCountFromJson(
          json['competitors_count'] as String?),
      competitorsLimit: json['competitor_limit'] as int,
    );
