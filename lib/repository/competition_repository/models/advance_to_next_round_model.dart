import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'advance_to_next_round_model.g.dart';

@JsonSerializable(createToJson: false)
class AdvanceToNextRoundModel extends Equatable {
  @JsonKey(name: 'value')
  final int value;

  @JsonKey(name: 'is_percent')
  final bool isPercent;

  const AdvanceToNextRoundModel({
    required this.value,
    required this.isPercent,
  });

  factory AdvanceToNextRoundModel.fromJson(Map<String, dynamic> json) =>
      _$AdvanceToNextRoundModelFromJson(json);

  String get getAdvanceToNextRound {
    if (isPercent) {
      return "$value%";
    } else {
      return 'Лучшие $value';
    }
  }

  @override
  List<Object> get props => [value, isPercent];
}
