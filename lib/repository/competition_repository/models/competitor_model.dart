import 'package:equatable/equatable.dart';
import 'package:funcubing/repository/competition_repository/models/member_competition_model.dart';
import 'package:funcubing/repository/competition_repository/models/personal_record_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competitor_model.g.dart';

@JsonSerializable(createToJson: false)
class CompetitorModel extends Equatable {
  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "wca_id", fromJson: _wcaIdFromJson)
  final String? wcaId;

  @JsonKey(name: "fc_id")
  final String fcId;

  @JsonKey(name: "competitions", fromJson: _competitionsFromJson)
  final List<MemberCompetitionModel> competitions;

  @JsonKey(name: "personal_records", fromJson: _personalRecordsFromJson)
  final List<PersonalRecordModel>? personalRecords;

  const CompetitorModel({
    required this.name,
    required this.wcaId,
    required this.fcId,
    required this.competitions,
    required this.personalRecords,
  });

  factory CompetitorModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitorModelFromJson(json);

  static List<MemberCompetitionModel> _competitionsFromJson(
      dynamic competition) {
    final memberCompetitionList = <MemberCompetitionModel>[];
    final competitionsMap = (competition as Map);
    for (var key in competitionsMap.keys) {
      final memberCompetition =
          MemberCompetitionModel.fromJson(competitionsMap[key]);
      memberCompetitionList.add(memberCompetition);
    }
    return memberCompetitionList;
  }

  static List<PersonalRecordModel>? _personalRecordsFromJson(
      dynamic personalRecords) {
    if (personalRecords == null) return null;
    final personalRecordsList = <PersonalRecordModel>[];
    final personalRecordsMap = personalRecords as Map;
    for (var key in personalRecordsMap.keys) {
      if ((key as String).isEmpty) continue;
      personalRecordsList.add(PersonalRecordModel(
          event: key,
          single: personalRecordsMap[key]["single"]?.toString(),
          average: personalRecordsMap[key]["average"]?.toString()));
    }
    return personalRecordsList;
  }

  static String? _wcaIdFromJson(dynamic wcaId) {
    if (wcaId is bool) return null;
    return wcaId;
  }

  @override
  List<Object?> get props => [
        name,
        wcaId,
        fcId,
        competitions,
        personalRecords,
      ];
}
