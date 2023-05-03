import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organizer_model.g.dart';

@JsonSerializable(createToJson: false)
class OrganizerModel extends Equatable {
  @JsonKey(name: 'name')
  final String name;

  const OrganizerModel({
    required this.name,
  });

  factory OrganizerModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizerModelFromJson(json);

  @override
  List<Object> get props => [name];
}
