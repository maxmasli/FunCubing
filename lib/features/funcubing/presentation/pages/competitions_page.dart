import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/features/funcubing/presentation/bloc/competitions/competitions_bloc.dart';
import 'package:funcubing/features/funcubing/presentation/pages/competition_tab_bar_view.dart';

class CompetitionsPage extends StatelessWidget {
  const CompetitionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Соревнования")),
        body: BlocBuilder<CompetitionsBloc, CompetitionsState>(
          builder: (context, state) {
            final bloc = context.read<CompetitionsBloc>();
            if (!state.isLoading && state.competitionsList.isNotEmpty) {
              return ListView.builder(
                itemCount: state.competitionsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      state.competitionsList[index].name ?? "Null",
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      bloc.add(CompetitionGetDetailsEvent(index));
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: bloc,
                          child: const CompetitionTabBarView(),
                        ),
                      ));
                    },
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
