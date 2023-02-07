import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/features/funcubing/presentation/bloc/competitions/competitions_bloc.dart';
import 'package:funcubing/features/funcubing/presentation/pages/competition_page.dart';
import 'package:funcubing/features/funcubing/presentation/pages/events_page.dart';
import 'package:funcubing/features/funcubing/presentation/pages/registrations_page.dart';
import 'package:funcubing/features/funcubing/presentation/pages/results_page.dart';

class CompetitionTabBarView extends StatelessWidget {
  const CompetitionTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CompetitionsBloc, CompetitionsState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: Text(state.currentCompetition!.name ?? ""),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: "Соревнование"),
                    Tab(text: "Дисциплины"),
                    Tab(text: "Регистрации"),
                    Tab(text: "Результаты"),
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  CompetitionPage(),
                  EventsPage(),
                  RegistrationsPage(),
                  ResultsPage(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
