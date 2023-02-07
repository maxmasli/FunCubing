import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/di.dart';
import 'package:funcubing/features/funcubing/presentation/bloc/theme/theme_bloc.dart';
import 'package:funcubing/navigation.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThemeBloc>()..add(ThemeAppStartedEvent()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          var themeMode = ThemeMode.light;
          if (state.isDark) {
            themeMode = ThemeMode.dark;
          }
          return MaterialApp(
            routes: routes,
            initialRoute: initialRoute,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            themeMode: themeMode,
          );
        },
      ),
    );
  }
}
