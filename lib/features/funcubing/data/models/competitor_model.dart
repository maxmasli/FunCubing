import 'package:funcubing/features/funcubing/domain/entities/competitor_entity.dart';

class CompetitorModel extends CompetitorEntity {
  const CompetitorModel(
      {super.competitionId,
      super.eventIds,
      super.fcId,
      super.id,
      super.name,
      super.wcaId});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'competition_id': competitionId,
      'fc_id': fcId,
      'wca_id': wcaId,
      'name': name,
      'event_ids': eventIds,
    };
  }

  factory CompetitorModel.fromJson(Map<String, dynamic> map) {
    String? wcaId; // апи возвращает либо строку либо нул либо булеву
    if (map['wca_id'] is String?) {
      wcaId = map['wca_id'] as String?;
    } else if (map['wca_id'] is bool) {
      wcaId = null;
    }
    return CompetitorModel(
      id: map['id'] as int?,
      competitionId: map['competition_id'] as String?,
      fcId: map['fc_id'] as String?,
      wcaId: wcaId,
      name: map['name'] as String?,
      eventIds: (map['event_ids'] as List).map((str) => str as String).toList(),
    );
  }
}
