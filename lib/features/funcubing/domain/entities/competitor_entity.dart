import 'package:equatable/equatable.dart';

class CompetitorEntity extends Equatable {
  final int? id;
  final String? competitionId;
  final String? fcId;
  final String? wcaId;
  final String? name;
  final List<String>? eventIds;

  const CompetitorEntity({
    this.id,
    this.competitionId,
    this.fcId,
    this.wcaId,
    this.name,
    this.eventIds,
  });
  
  @override
  List<Object?> get props => [id, competitionId, fcId, wcaId, name, eventIds];
}