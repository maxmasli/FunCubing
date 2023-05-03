import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/core/widgets/error_widget.dart';
import 'package:funcubing/features/competition_details/view/competition_details_page.dart';
import 'package:funcubing/features/competitions_page/bloc/competition_bloc.dart';
import 'package:funcubing/generated/locale_keys.g.dart';

class CompetitionsPage extends StatefulWidget {
  const CompetitionsPage({Key? key}) : super(key: key);

  @override
  State<CompetitionsPage> createState() => _CompetitionsPageState();

  static String route() {
    return '/competitions';
  }
}

class _CompetitionsPageState extends State<CompetitionsPage> {
  final _textEditingQueryController = TextEditingController();

  final _competitionBloc = CompetitionBloc()..add(CompetitionGetList());

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _competitionBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.competitions.tr()),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (String changedText) {
                  //GetIt.I<Talker>().debug(changedText);
                  _competitionBloc.add(CompetitionSearch(changedText));
                },
                style: const TextStyle(fontSize: 20),
                maxLines: 1,
                controller: _textEditingQueryController,
                decoration: InputDecoration(
                  isDense: true,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none
                  )
                ),
              ),
            ),
          ),
        ),
        body: const _CompetitionsListWidget(),
      ),
    );
  }
}

class _CompetitionsListWidget extends StatelessWidget {
  const _CompetitionsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CompetitionBloc>();
    return BlocBuilder<CompetitionBloc, CompetitionState>(
      builder: (context, state) {
        if (state is CompetitionLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CompetitionLoaded) {
          return ListView.builder(
              itemCount: state.sortedCompetitionList.length,
              itemBuilder: (context, index) {
                final competition = state.sortedCompetitionList[index];
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CompetitionDetailsPage.route(),
                      arguments: [competition.id, competition.name],
                    );
                  },
                  title: Text(competition.name),
                  subtitle: Text(competition.city ?? ""),
                );
              });
        } else {
          return InternetErrorWidget(
            message: LocaleKeys.something_went_wrong.tr(),
            onPressed: () {
              bloc.add(CompetitionGetList());
            },
          );
        }
      },
    );
  }
}
