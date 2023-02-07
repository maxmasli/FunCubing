import 'package:equatable/equatable.dart';

class RoundEntity extends Equatable {
  final String? current;
  final String? total;
  final String? name;

  const RoundEntity({
    this.current,
    this.total,
    this.name,
  });

  @override
  List<Object?> get props => [current, total, name];
}