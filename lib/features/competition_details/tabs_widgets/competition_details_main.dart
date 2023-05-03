import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/core/extensions/datetime_extension.dart';
import 'package:funcubing/core/utils/utils.dart';
import 'package:funcubing/core/widgets/error_widget.dart';
import 'package:funcubing/features/competition_details/bloc/competition_details_bloc.dart';
import 'package:funcubing/features/competition_details/widgets/selectable_text_widget.dart';
import 'package:funcubing/features/competition_details/widgets/widgets.dart';
import 'package:funcubing/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class CompetitionDetailsMainWidget extends StatelessWidget {
  const CompetitionDetailsMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitionDetailsBloc, CompetitionDetailsState>(
      builder: (context, state) {
        final bloc = context.read<CompetitionDetailsBloc>();
        if (state is CompetitionDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CompetitionDetailsLoaded) {
          final competitionDetails = state.competitionDetailsModel;
          final date = competitionDetails.startDate;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      competitionDetails.name,
                      style: const TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  LogoWidget(url: competitionDetails.logoUrl),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.date_range, size: 25),
                            Text(
                              date.getFormatDate(),
                              style: const TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Text(
                            "${competitionDetails.competitorsCount}/${competitionDetails.competitorsLimit}",
                            style: const TextStyle(fontSize: 25))
                      ],
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: OrganizersListWidget(
                          organizersList: competitionDetails.organizers)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.place, size: 25),
                          Text(competitionDetails.city ?? '-',
                              style: const TextStyle(fontSize: 20)),
                        ],
                      ),
                      if (competitionDetails.site.isNotEmpty)
                        IconButton(
                            onPressed: () async {
                              await launchUrl(
                                  Uri.parse(competitionDetails.site));
                            },
                            icon: const Icon(Icons.public)),
                    ],
                  ),
                  if (hasHtmlTags(competitionDetails.description ?? ''))
                    SelectableHtml(html: competitionDetails.description ?? '')
                  else
                    SelectableText(
                      competitionDetails.description ?? '',
                      style: const TextStyle(fontSize: 18),
                    )
                ],
              ),
            ),
          );
        } else {
          return InternetErrorWidget(
            message: LocaleKeys.something_went_wrong.tr(),
            onPressed: () {
              bloc.add(GetCompetitionDetails());
            },
          );
        }
      },
    );
  }
}
