import 'package:equatable/equatable.dart';
import 'package:funcubing/features/funcubing/domain/entities/delegate_entity.dart';
import 'package:funcubing/features/funcubing/domain/entities/organizer_entity.dart';
import 'package:funcubing/features/funcubing/domain/entities/sheet_entity.dart';

class CompetitionEntity extends Equatable {
  final String? id;
  final String? name;
  final int? competitorLimit;
  final String? city;
  final String? url;
  final String? localId;
  final String? website;
  final String? logo;
  final String? details;
  final String? startDate;
  final String? endDate;
  final bool isPublish;
  final bool isRanked;
  final bool isApproved;
  final String? points;
  final List<DelegateEntity>? delegates;
  final List<OrganizerEntity>? organizers;
  final String? competitorsCount;
  final List<SheetEntity>? sheets;

  const CompetitionEntity({
    this.id,
    this.name,
    this.competitorLimit,
    this.city,
    this.url,
    this.localId,
    this.website,
    this.logo,
    this.details,
    this.startDate,
    this.endDate,
    required this.isPublish,
    required this.isRanked,
    required this.isApproved,
    this.points,
    this.delegates,
    this.organizers,
    this.competitorsCount,
    this.sheets,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        competitorLimit,
        city,
        url,
        localId,
        website,
        logo,
        details,
        startDate,
        endDate,
        isPublish,
        isRanked,
        isApproved,
        points,
        delegates,
        organizers,
        competitorsCount,
        sheets,
      ];
}
