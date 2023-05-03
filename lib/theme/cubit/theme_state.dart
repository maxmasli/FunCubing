part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.isDark});

  final bool isDark;

  ThemeState copyWith({bool? isDark}) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
    );
  }

  @override
  List<Object> get props => [isDark];
}
