import 'package:equatable/equatable.dart';
import 'package:funcubing/repository/competition_repository/models/personal_record_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_competition_model.g.dart';

@JsonSerializable(createToJson: false)
class MemberCompetitionModel extends Equatable {

  @JsonKey(name: "competitor_id")
  final int competitorId;

  @JsonKey(name: "competition_id")
  final String competitionId;

  @JsonKey(name: "competition_name")
  final String competitionName;

  @JsonKey(name: "personal_records", fromJson: _personalRecordsFromJson)
  final List<PersonalRecordModel>? personalRecords;

  const MemberCompetitionModel({
    required this.competitorId,
    required this.competitionId,
    required this.competitionName,
    required this.personalRecords,
  });

  factory MemberCompetitionModel.fromJson(Map<String, dynamic> json) =>
      _$MemberCompetitionModelFromJson(json);

  static List<PersonalRecordModel>? _personalRecordsFromJson(dynamic personalRecords) {
    if (personalRecords == null) return null;
    final personalRecordsList = <PersonalRecordModel>[];
    final personalRecordsMap = personalRecords as Map;
    for (var key in personalRecordsMap.keys) {
      if ((key as String).isEmpty) continue;
      personalRecordsList.add(PersonalRecordModel(
          event: key,
          single: personalRecordsMap[key]["single"].toString(),
          average: personalRecordsMap[key]["average"].toString()));
    }
    return personalRecordsList;
  }

  @override
  List<Object?> get props =>
      [competitorId, competitionId, competitionName, personalRecords,];
}