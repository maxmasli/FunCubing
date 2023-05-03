import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competition_model.g.dart';

@JsonSerializable(createToJson: false)
class CompetitionModel extends Equatable {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "city")
  final String? city;

  const CompetitionModel({
    required this.id,
    required this.name,
    required this.city,
  });

  factory CompetitionModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionModelFromJson(json);

  @override
  List<Object?> get props => [id, name, city];
}
