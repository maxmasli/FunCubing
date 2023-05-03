import 'dart:async';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/funcubing_app.dart';
import 'package:funcubing/repository/competition_repository/abstract_comp_repository.dart';
import 'package:funcubing/repository/competition_repository/competition_repository.dart';
import 'package:funcubing/repository/theme_source/theme_source.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final talker = Talker();
  final dio = Dio();
  final sharedPreferences = await SharedPreferences.getInstance();

  GetIt.I.registerSingleton(talker);
  GetIt.I.registerSingleton(dio);
  GetIt.I.registerSingleton<AbstractCompetitionRepository>(
      CompetitionRepository(dio));
  GetIt.I.registerSingleton(sharedPreferences);
  GetIt.I.registerSingleton<AbstractThemeSource>(
      ThemeSource(sharedPreferences: sharedPreferences));

  Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(printStateFullData: false));

  dio.interceptors.add(
    TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printResponseData: false,
        )),
  );

  runZonedGuarded(() => runApp(const FuncubingApp()), (error, stack) {
    talker.handle(error, stack);
  });
}
