import 'package:funcubing/features/funcubing/domain/entities/result_entity.dart';

class ResultModel extends ResultEntity {

  const ResultModel({
    super.id,
    super.registrationId,
    super.competitionId,
    super.eventId,
    super.round,
    super.pos,
    super.name,
    super.fcId,
    super.wcaId,
    super.attempts,
    super.best,
    super.average,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'registration_id': registrationId,
      'competition_id': competitionId,
      'event_id': eventId,
      'round': round,
      'pos': pos,
      'name': name,
      'fcId': fcId,
      'wcaid': wcaId,
      'attempts': attempts,
      'best': best,
      'average': average,
    };
  }

  factory ResultModel.fromJson(Map<String, dynamic> map) {
    try {
      String? wcaId;
      if (map['wca_id'] is bool) {
        wcaId = null;
      } else {
        wcaId = map['wca_id'] as String?;
      }

      return ResultModel(
        id: map['id'] as int,
        registrationId: map['registration_id'] as String?,
        competitionId: map['competition_id'] as String?,
        eventId: map['event_id'] as String?,
        round: map['round'] as int?,
        pos: map['pos'] as int?,
        name: map['name'] as String?,
        fcId: map['fcId'] as String?,
        wcaId: wcaId,
        attempts: (map['attempts'] as List).map((e) => e.toString() as String).toList(),
        best: map['best'].toString() as String?,
        average: map['average'].toString() as String?,
      );
    } catch (e){
      print(e);
      throw Exception();
    }
  }
}