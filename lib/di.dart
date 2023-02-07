import 'package:funcubing/features/funcubing/data/data_sources/fun_cubing_remote_data_source.dart';
import 'package:funcubing/features/funcubing/data/data_sources/shared_prefs_local_data_source.dart';
import 'package:funcubing/features/funcubing/data/repositories/fun_cubing_repository_impl.dart';
import 'package:funcubing/features/funcubing/data/repositories/shared_prefs_repository_impl.dart';
import 'package:funcubing/features/funcubing/domain/repositories/fun_cubing_repository.dart';
import 'package:funcubing/features/funcubing/domain/repositories/shared_prefs_repository.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/get_competition_events_use_case.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/get_competition_registrations_use_case.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/get_competition_results_use_case.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/get_competitions_use_case.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/get_theme_use_case.dart';
import 'package:funcubing/features/funcubing/domain/use_cases/save_theme_use_case.dart';
import 'package:funcubing/features/funcubing/presentation/bloc/competitions/competitions_bloc.dart';
import 'package:funcubing/features/funcubing/presentation/bloc/theme/theme_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => CompetitionsBloc(
      getCompetitionsUseCase: sl(),
      getCompetitionRegistrationUseCase: sl(),
      getCompetitionEventsUseCase: sl(),
      getCompetitionResultsUseCase: sl()));

  sl.registerFactory(() => ThemeBloc(
        getThemeUseCase: sl(),
        saveThemeUseCase: sl(),
      ));

  //Use Cases
  sl.registerLazySingleton(
      () => GetCompetitionsUseCase(funCubingRepository: sl()));
  sl.registerLazySingleton(
      () => GetCompetitionRegistrationUseCase(funCubingRepository: sl()));
  sl.registerLazySingleton(
      () => GetCompetitionEventsUseCase(funCubingRepository: sl()));
  sl.registerLazySingleton(
      () => GetCompetitionResultsUseCase(funCubingRepository: sl()));
  sl.registerLazySingleton(() => GetThemeUseCase(sharedPrefsRepository: sl()));
  sl.registerLazySingleton(() => SaveThemeUseCase(sharedPrefsRepository: sl()));

  //Repositories
  sl.registerLazySingleton<FunCubingRepository>(
      () => FunCubingRepositoryImpl(funCubingRemoteDataSource: sl()));

  sl.registerLazySingleton<SharedPrefsRepository>(
      () => SharedPrefsRepositoryImpl(sharedPrefsLocalDataSource: sl()));

  //Data sources
  sl.registerLazySingleton<FunCubingRemoteDataSource>(
      () => FunCubingRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<SharedPrefsLocalDataSource>(
      () => SharedPrefsLocalDataSourceImpl(sharedPreferences: sl()));

  //External
  final sp = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<SharedPreferences>(() => sp);
}
