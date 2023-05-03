import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/features/competitions_page/competitions_page.dart';
import 'package:funcubing/generated/locale_keys.g.dart';
import 'package:funcubing/theme/cubit/theme_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ThemeCubit>();
    final isDark = cubit.state.isDark;
    final actionIcon = isDark ? Icons.dark_mode : Icons.light_mode;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Funcubing"),
        actions: [
          IconButton(
            onPressed: () => cubit.switchTheme(),
            icon: Icon(actionIcon),
          ),
          IconButton(
            onPressed: () {
              if (context.locale == const Locale('ru')){
                context.setLocale(const Locale('en'));
              } else {
                context.setLocale(const Locale('ru'));
              }
            },
            icon: const Icon(Icons.language)
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(CompetitionsPage.route());
            },
            title: Text(LocaleKeys.competitions.tr()),
          ),
        ],
      ),
    );
  }
}
