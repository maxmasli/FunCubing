import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'round_model.g.dart';

@JsonSerializable(createToJson: false)
class RoundModel extends Equatable {
  @JsonKey(name: 'this')
  final String currentRound;

  @JsonKey(name: 'total')
  final String totalRounds;

  @JsonKey(name: 'name')
  final String name;

  const RoundModel({
    required this.currentRound,
    required this.totalRounds,
    required this.name,
  });

  String get getRound {
    if (currentRound == totalRounds) {
      return 'Финал';
    }
    return name;
  }

  factory RoundModel.fromJson(Map<String, dynamic> json) =>
      _$RoundModelFromJson(json);

  @override
  List<Object> get props => [currentRound, totalRounds, name];
}
