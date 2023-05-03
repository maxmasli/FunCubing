import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/repository/theme_source/theme_source.dart';
import 'package:get_it/get_it.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(isDark: false));

  final themeSource = GetIt.I<AbstractThemeSource>();

  void switchTheme() async {
    final updated = !state.isDark;
    emit(state.copyWith(isDark: updated));
    await themeSource.saveTheme(updated);
  }

  void loadTheme() async {
    emit(state.copyWith(isDark: await themeSource.isDark()));
  }
}
