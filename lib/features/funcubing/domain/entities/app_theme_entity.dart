import 'package:equatable/equatable.dart';

class AppThemeEntity extends Equatable {
  final bool isDark;

  const AppThemeEntity({
    required this.isDark,
  });

  @override
  List<Object> get props => [isDark];
}