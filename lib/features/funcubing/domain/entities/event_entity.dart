import 'package:equatable/equatable.dart';
import 'package:funcubing/features/funcubing/domain/entities/round_entity.dart';
import 'package:funcubing/features/funcubing/domain/entities/advance_entity.dart';

class EventEntity extends Equatable {
  final String? id;
  final String? competitionId;
  final String? event;
  final String? name;
  final bool isSpecial;
  final RoundEntity? round;
  final AdvanceEntity? advanceToNextRound;
  final String? cutoff;
  final String? timeLimit;
  final String? format;
  final String? formatType;
  final int? attempts;
  final int? cutoffAttempts;
  final String? result;
  final String? resultType;

  const EventEntity({
    this.id,
    this.competitionId,
    this.event,
    this.name,
    required this.isSpecial,
    this.round,
    this.advanceToNextRound,
    this.cutoff,
    this.timeLimit,
    this.format,
    this.formatType,
    this.attempts,
    this.cutoffAttempts,
    this.result,
    this.resultType,
  });

  @override
  List<Object?> get props => [
        id,
        competitionId,
        event,
        name,
        isSpecial,
        round,
        advanceToNextRound,
        cutoff,
        timeLimit,
        format,
        formatType,
        attempts,
        cutoffAttempts,
        result,
        resultType,
      ];
}
