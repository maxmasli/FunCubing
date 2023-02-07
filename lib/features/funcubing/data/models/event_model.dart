import 'package:funcubing/features/funcubing/data/models/advance_model.dart';
import 'package:funcubing/features/funcubing/data/models/round_model.dart';
import 'package:funcubing/features/funcubing/domain/entities/event_entity.dart';

class EventModel extends EventEntity {
  const EventModel({
    required super.isSpecial,
    super.advanceToNextRound,
    super.attempts,
    super.competitionId,
    super.cutoff,
    super.cutoffAttempts,
    super.event,
    super.format,
    super.formatType,
    super.id,
    super.name,
    super.result,
    super.resultType,
    super.round,
    super.timeLimit,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'competition_id': competitionId,
      'event': event,
      'name': name,
      'is_special': isSpecial,
      'round': round,
      'advance_to_next_round': advanceToNextRound,
      'cutoff': cutoff,
      'time_limit': timeLimit,
      'format': format,
      'format_type': formatType,
      'attempts': attempts,
      'cutoff_Attempts': cutoffAttempts,
      'result': result,
      'result_type': resultType,
    };
  }

  factory EventModel.fromJson(Map<String, dynamic> map) {
    RoundModel? round;
    if (map['round'] != null) {
      round = RoundModel.fromJson(map['round']);
    }
    AdvanceModel? advance;
    if (map['advance_to_next_round'] != null) {
      advance = AdvanceModel.fromJson(map['advance_to_next_round']);
    }

    return EventModel(
      id: map['id'] as String?,
      competitionId: map['competition_id'] as String?,
      event: map['event'] as String?,
      name: map['name'] as String?,
      isSpecial: map['is_special'] as bool,
      round: round,
      advanceToNextRound: advance,
      cutoff: map['cutoff'] as String?,
      timeLimit: map['time_limit'] as String?,
      format: map['format'] as String?,
      formatType: map['format_type'] as String?,
      attempts: map['attempts'] as int?,
      cutoffAttempts: map['cutoff_attempts'] as int?,
      result: map['result'] as String?,
      resultType: map['result_type'] as String?,
    );
  }
}
