import 'package:equatable/equatable.dart';
import 'package:funcubing/features/core/utils/utils.dart';

class ResultEntity extends Equatable {
  final int? id;
  final String? registrationId;
  final String? competitionId;
  final String? eventId;
  final int? round;
  final int? pos;
  final String? name;
  final String? fcId;
  final String? wcaId;
  final List<String>? attempts;
  final String? best;
  final String? average;

  const ResultEntity({
    this.id,
    this.registrationId,
    this.competitionId,
    this.eventId,
    this.round,
    this.pos,
    this.name,
    this.fcId,
    this.wcaId,
    this.attempts,
    this.best,
    this.average,
  });

  String get bestString {
    if (best == null) {
      return "-";
    }
    int? timeParse = int.tryParse(best!);
    if (timeParse == null) {
      return best!;
    } else {
      return millisToString(timeParse);
    }
  }

  String get averageString {
    if (average == null) {
      return "-";
    }
    int? timeParse = int.tryParse(average!);
    if (timeParse == null) {
      return average!;
    } else {
      return millisToString(timeParse);
    }
  }

  String attemptToString(String? att) {
    if (att == null) {
      return "-";
    }
    int? timeParse = int.tryParse(att);
    if (timeParse == null) {
      return att;
    } else {
      return millisToString(timeParse);
    }
  }

  @override
  List<Object?> get props => [
        id,
        registrationId,
        competitionId,
        eventId,
        round,
        pos,
        name,
        fcId,
        wcaId,
        attempts,
        best,
        average,
      ];
}
