import 'package:equatable/equatable.dart';

class OrganizerEntity extends Equatable {
  final String? wcaId;
  final String? name;
  final bool main;

  const OrganizerEntity({
    this.wcaId,
    this.name,
    required this.main,
  });

  @override
  List<Object?> get props => [wcaId, name, main];
}