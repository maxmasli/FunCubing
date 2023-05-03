import 'package:equatable/equatable.dart';
import 'package:funcubing/core/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal_record_model.g.dart';

@JsonSerializable(createToJson: false)
class PersonalRecordModel extends Equatable {
  final String event;

  @JsonKey(name: "single")
  final String? single;

  @JsonKey(name: "average")
  final String? average;

  const PersonalRecordModel({
    required this.event,
    required this.single,
    required this.average,
  });

  factory PersonalRecordModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalRecordModelFromJson(json);

  String get getSingle {
    if (single == null) return "DNF";
    final parse = int.tryParse(single!);
    if (parse != null) {
      if (parse <= 0) return "DNF";
      if (event.contains("333fm")) {
        return single!;
      }
      return millisToString(parse);
    }
    return single!;

  }

  String get getAverage {
    if (average == null) return "DNF";
    final parse = int.tryParse(average!);
    if (parse != null) {
      if (parse <= 0) return "DNF";
      if (event.contains("333fm")) {
        if (average!.length > 3){
          return (parse/100.0).toString();
        }
        return average!;
      }
      return millisToString(parse);
    }
    return average!;
  }

  @override
  List<Object?> get props => [event, single, average];
}
