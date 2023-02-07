import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:funcubing/features/core/use_case/use_case.dart';
import 'package:funcubing/features/funcubing/domain/entities/app_theme_entity.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/get_theme_use_case.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/save_theme_use_case.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase _getThemeUseCase;
  final SaveThemeUseCase _saveThemeUseCase;

  ThemeBloc(
      {required GetThemeUseCase getThemeUseCase,
      required SaveThemeUseCase saveThemeUseCase})
      : _getThemeUseCase = getThemeUseCase,
        _saveThemeUseCase = saveThemeUseCase,
        super(const ThemeState(isDark: false)) {

    on<ThemeChangedEvent>((event, emit) async {
      final newTheme = !state.isDark;
      emit(state.copyWith(isDark: newTheme));
      await _saveThemeUseCase(ThemeParams(AppThemeEntity(isDark: newTheme)));
    });


    on<ThemeAppStartedEvent>((event, emit) async {
      final theme = await _getThemeUseCase(NoParams());
      theme.fold(
        (l) => emit(state.copyWith(isDark: false)),
        (theme) => emit(state.copyWith(isDark: theme.isDark)),
      );
    });
  }
}
