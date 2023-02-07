part of 'theme_bloc.dart';

class ThemeState extends Equatable {

  final bool isDark;

  const ThemeState({required this.isDark});

  ThemeState copyWith({
    bool isDark = false,
  }) {
    return ThemeState(
      isDark: isDark,
    );
  }

  @override
  List<Object> get props => [isDark];
}
