import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competition_member_model.g.dart';

@JsonSerializable(createToJson: false)
class CompetitionMemberModel extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'wca_id', fromJson: _wcaIdFromJson)
  final String? wcaId;

  @JsonKey(name: 'fc_id')
  final String? fcId;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'event_ids')
  final List<String> eventIds;

  const CompetitionMemberModel({
    required this.id,
    required this.wcaId,
    required this.fcId,
    required this.name,
    required this.eventIds,
  });

  factory CompetitionMemberModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionMemberModelFromJson(json);

  static String? _wcaIdFromJson(dynamic wcaId) {
    if (wcaId is bool) return null;
    if (wcaId is String) {
      return wcaId;
    } else {
      return null;
    }
  }

  @override
  List<Object?> get props => [id, wcaId, fcId, name, eventIds];
}
