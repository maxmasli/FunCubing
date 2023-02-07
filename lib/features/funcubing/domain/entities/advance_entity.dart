import 'package:equatable/equatable.dart';

class AdvanceEntity extends Equatable {
  final int? value;
  final bool isPercent;

  const AdvanceEntity({
    this.value,
    required this.isPercent,
  });

  @override
  List<Object?> get props => [value, isPercent];
}