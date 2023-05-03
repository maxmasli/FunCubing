import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/generated/codegen_loader.g.dart';
import 'package:funcubing/routes/routes.dart';
import 'package:funcubing/theme/cubit/theme_cubit.dart';
import 'package:funcubing/theme/theme.dart';

class FuncubingApp extends StatelessWidget {
  const FuncubingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: BlocProvider(
        create: (context) => ThemeCubit()..loadTheme(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routes: routes,
              initialRoute: initialRoute,
              theme: createLightTheme(state.isDark),
            );
          },
        ),
      ),
    );
  }
}
