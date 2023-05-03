import 'package:equatable/equatable.dart';
import 'package:funcubing/repository/competition_repository/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competition_event_model.g.dart';

@JsonSerializable(createToJson: false)
class CompetitionEventModel extends Equatable {
  const CompetitionEventModel({
    required this.id,
    required this.name,
    required this.round,
    required this.format,
    this.cutoff,
    this.limit,
    this.advanceToNextRoundModel,
  });

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'round')
  final RoundModel round;

  @JsonKey(name: 'format')
  final String format;

  @JsonKey(name: 'cutoff')
  final String? cutoff;

  @JsonKey(name: 'time_limit')
  final String? limit;

  @JsonKey(name: 'advance_to_next_round')
  final AdvanceToNextRoundModel? advanceToNextRoundModel;

  factory CompetitionEventModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionEventModelFromJson(json);

  String get getCutoff {
    if (cutoff == null) return '-';
    return cutoff!;
  }

  String get getLimit {
    if (limit == null) return '-';
    return limit!;
  }

  String get getAdvanceToNextRound {
    if (advanceToNextRoundModel == null) return '-';
    return advanceToNextRoundModel!.getAdvanceToNextRound;
  }


  @override
  List<Object?> get props => [
        name,
        round,
        format,
        cutoff,
        limit,
        advanceToNextRoundModel,
      ];
}
