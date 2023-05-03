import 'package:equatable/equatable.dart';
import 'package:funcubing/repository/competition_repository/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competition_details_model.g.dart';

@JsonSerializable(createToJson: false)
class CompetitionDetailsModel extends Equatable {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'website')
  final String site;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'start_date')
  final DateTime startDate;

  @JsonKey(name: 'logo')
  final String logoUrl;

  @JsonKey(name: 'details')
  final String? description;

  @JsonKey(name: 'organizers')
  final List<OrganizerModel> organizers;

  @JsonKey(name: 'competitor_limit')
  final int competitorsLimit;

  @JsonKey(name: 'competitors_count', fromJson: _competitorsCountFromJson)
  final int competitorsCount;

  const CompetitionDetailsModel({
    required this.id,
    required this.name,
    this.city,
    required this.site,
    required this.startDate,
    required this.logoUrl,
    required this.description,
    required this.organizers,
    required this.competitorsCount,
    required this.competitorsLimit,
  });

  factory CompetitionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionDetailsModelFromJson(json);

  static int _competitorsCountFromJson(String? count) {
    if (count == null) return 0;
    return int.tryParse(count) ?? 0;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        site,
        city,
        startDate,
        logoUrl,
        description,
        organizers,
        competitorsLimit,
        competitorsCount,
      ];
}
