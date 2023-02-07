import 'package:funcubing/features/funcubing/data/models/organizer_model.dart';
import 'package:funcubing/features/funcubing/data/models/sheet_model.dart';
import 'package:funcubing/features/funcubing/domain/entities/competition_entity.dart';
import 'delegate_model.dart';

class CompetitionModel extends CompetitionEntity {
  const CompetitionModel(
      {super.id,
      super.name,
      super.competitorLimit,
      super.city,
      super.url,
      super.localId,
      super.website,
      super.logo,
      super.details,
      super.startDate,
      super.endDate,
      required super.isPublish,
      required super.isRanked,
      required super.isApproved,
      super.points,
      super.delegates,
      super.organizers,
      super.competitorsCount,
      super.sheets});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'competitor_limit': competitorLimit,
      'city': city,
      'url': url,
      'localId': localId,
      'website': website,
      'logo': logo,
      'details': details,
      'startDate': startDate,
      'endDate': endDate,
      'isPublish': isPublish,
      'isRanked': isRanked,
      'isApproved': isApproved,
      'points': points,
      'delegates': delegates,
      'organizers': organizers,
      'competitors_count': competitorsCount,
      'sheets': sheets,
    };
  }



  factory CompetitionModel.fromJson(Map<String, dynamic> map) {
    return CompetitionModel(
      id: map['id'] as String?,
      name: map['name'] as String?,
      competitorLimit: map['competitor_limit'] as int?,
      city: map['city'] as String?,
      url: map['url'] as String?,
      localId: map['local_id'] as String?,
      website: map['website'] as String?,
      logo: map['logo'] as String?,
      details: map['details'] as String?,
      startDate: map['start_date'] as String?,
      endDate: map['end_date'] as String?,
      isPublish: map['is_publish'] as bool,
      isRanked: map['is_ranked'] as bool,
      isApproved: map['is_approved'] as bool,
      points: map['points'] as String?,
      delegates: ((map['delegates'] as List<dynamic>?) ?? [])
          .map((delegate) => DelegateModel.fromJson(delegate))
          .toList(),
      organizers: ((map['organizers'] as List<dynamic>?) ?? [])
          .map((organizer) => OrganizerModel.fromJson(organizer))
          .toList(),
      competitorsCount: map['competitors_count'] as String?,
      sheets: ((map['sheets'] as List<dynamic>?) ?? [])
          .map((sheet) => SheetModel.fromJson(sheet))
          .toList(),
    );
  }
}
