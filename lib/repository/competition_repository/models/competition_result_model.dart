import 'package:equatable/equatable.dart';
import 'package:funcubing/core/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competition_result_model.g.dart';

@JsonSerializable(createToJson: false)
class CompetitionResultModel extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'event_id')
  final String eventId;

  @JsonKey(name: 'round')
  final int round;

  @JsonKey(name: 'pos')
  final int position;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'attempts', fromJson: _attemptsFromJson)
  final List<String> attempts;

  @JsonKey(name: 'best', fromJson: _bestFromJson)
  final String best;

  @JsonKey(name: 'average')
  final int average;

  const CompetitionResultModel({
    required this.id,
    required this.eventId,
    required this.round,
    required this.position,
    required this.name,
    required this.attempts,
    required this.best,
    required this.average,
  });

  factory CompetitionResultModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionResultModelFromJson(json);

  String get getAverage {
    if (average <= 0) return "DNF";
    if (eventId.contains("333fm")) {
      if (average.toString().length > 3){
        return (average/100.0).toString();
      }
      return average.toString();
    }
    return millisToString(average);
  }

  String get getBest {
    final parse = int.tryParse(best);
    if (parse != null) {
      if (parse <= 0) return "DNF";
      if (eventId.contains("333fm")) {
        return best;
      }
      return millisToString(parse);
    }
    return best;
  }

  List<String> get getAttempts {
    return attempts.map((e) {
      final parse = int.tryParse(e);
      if (parse != null) {
        if (parse <= 0) return "DNF";
        if (eventId.contains("333fm")) {
          return e;
        }
        return millisToString(parse);
      }
      return e;
    }).toList();
  }

  static List<String> _attemptsFromJson(List<dynamic> attempts) {
    final a = <String>[];
    for (dynamic att in attempts) {
      final parse = int.tryParse(att.toString());
      if (parse != null) {
        if (parse == 0) continue;
      }
      a.add(att.toString());
    }
    return a;
  }

  static String _bestFromJson(dynamic best) {
    return best.toString();
  }

  @override
  List<Object> get props => [
        id,
        eventId,
        round,
        position,
        name,
        attempts,
        best,
        average,
      ];
}
