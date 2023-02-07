import 'package:equatable/equatable.dart';

class SheetEntity extends Equatable {
  final String? sheet;
  final String? title;
  final String? content;

  const SheetEntity({
    this.sheet,
    this.title,
    this.content,
  });

  @override
  List<Object?> get props => [sheet, title, content];
}