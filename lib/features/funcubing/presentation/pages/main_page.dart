import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/features/funcubing/presentation/bloc/theme/theme_bloc.dart';
import 'package:funcubing/navigation.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final bloc = context.read<ThemeBloc>();
          var appBarThemeIcon = const Icon(Icons.dark_mode);
          if (state.isDark) {
            appBarThemeIcon = const Icon(Icons.light_mode);
          }
          return Scaffold(
            appBar: AppBar(title: const Text("FunCubing"), actions: [
              IconButton(
                icon: appBarThemeIcon,
                onPressed: () {
                  bloc.add(ThemeChangedEvent());
                },
              )
            ]),
            body: ListView(
              children: [
                ListTile(
                  title: const Text("Соревнования"),
                  onTap: () {
                    Navigator.of(context).pushNamed(competitionsPage);
                  },
                ),
                // ListTile(
                //   title: const Text("Competitors"),
                //   onTap: () {},
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
