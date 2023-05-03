import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/features/competition_details/bloc/competition_details_bloc.dart';
import 'package:funcubing/features/competition_details/tabs_widgets/tabs_widgets.dart';
import 'package:funcubing/generated/locale_keys.g.dart';

class CompetitionDetailsPage extends StatefulWidget {
  const CompetitionDetailsPage({Key? key}) : super(key: key);

  @override
  State<CompetitionDetailsPage> createState() => _CompetitionDetailsPageState();

  static String route() {
    return '/competitions/details';
  }
}

class _CompetitionDetailsPageState extends State<CompetitionDetailsPage> {
  late CompetitionDetailsBloc _competitionDetailsBloc;

  String name = "";

  @override
  void didChangeDependencies() {
    final argumentId = ((ModalRoute
        .of(context)
        ?.settings
        .arguments as List)[0]) as String;
    final argumentName = ((ModalRoute
        .of(context)
        ?.settings
        .arguments as List)[1]) as String;
    name = argumentName;
    //assert (argumentId == null, "");
    _competitionDetailsBloc = CompetitionDetailsBloc(id: argumentId)
      ..add(GetCompetitionDetails());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _competitionDetailsBloc,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(name),
            bottom: TabBar(
              tabs: [
                Tab(text: LocaleKeys.competition.tr()),
                Tab(text: LocaleKeys.events.tr()),
                Tab(text: LocaleKeys.members.tr()),
                Tab(text: LocaleKeys.results.tr()),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              CompetitionDetailsMainWidget(),
              CompetitionDetailsEventsWidget(),
              CompetitionDetailsMembersWidget(),
              CompetitionDetailsResultsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
