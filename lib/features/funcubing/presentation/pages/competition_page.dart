import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:funcubing/features/funcubing/presentation/bloc/competitions/competitions_bloc.dart';
import 'package:funcubing/features/funcubing/presentation/widgets/competition_page/info_list_widget.dart';
import 'package:funcubing/features/funcubing/presentation/widgets/competition_page/info_widget.dart';
import 'package:funcubing/features/funcubing/presentation/widgets/competition_page/logo_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CompetitionPage extends StatelessWidget {
  const CompetitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitionsBloc, CompetitionsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.currentCompetition!.logo != null &&
                    state.currentCompetition!.logo!.isNotEmpty) ...[
                  LogoWidget(url: state.currentCompetition!.logo!)
                ],
                InfoWidget(
                  name: "Город",
                  value: state.currentCompetition!.city ?? "",
                  icon: Icons.location_on,
                ),
                InfoWidget(
                  name: "Дата",
                  value: state.currentCompetition!.startDate ?? "",
                  icon: Icons.date_range,
                ),
                GestureDetector(
                  onTap: () => launchUrl(Uri.parse(state.currentCompetition!.website ?? '')),
                  child: InfoWidget(
                    style: const TextStyle(color: Colors.blue),
                    name: "Сайт",
                    icon: Icons.link_rounded,
                    value: state.currentCompetition!.website ?? "",
                  ),
                ),
                if (state.currentCompetition!.organizers != null) ...[
                  InfoListWidget(
                    name: "Организатор",
                    icon: Icons.perm_identity,
                    value: state.currentCompetition!.organizers!
                        .map((organizerEntity) => organizerEntity.name!)
                        .toList(),
                  ),
                ],
                HtmlWidget(state.currentCompetition!.details ?? "")
              ],
            ),
          ),
        );
      },
    );
  }
}
