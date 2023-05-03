import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/core/widgets/error_widget.dart';
import 'package:funcubing/features/competition_details/bloc/competition_details_bloc.dart';
import 'package:funcubing/generated/locale_keys.g.dart';

class CompetitionDetailsEventsWidget extends StatelessWidget {
  const CompetitionDetailsEventsWidget({Key? key}) : super(key: key);

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
          final eventsList = state.eventsList;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text(LocaleKeys.event.tr())),
                  DataColumn(label: Text(LocaleKeys.round.tr())),
                  DataColumn(label: Text(LocaleKeys.format.tr())),
                  DataColumn(label: Text(LocaleKeys.cutoff.tr())),
                  DataColumn(label: Text(LocaleKeys.limit.tr())),
                  DataColumn(label: Text(LocaleKeys.advance_to_next_round.tr())),
                ],
                rows: eventsList.map((event) => DataRow(
                  cells: [
                    DataCell(
                      SizedBox(
                        width: 120,
                        child: Text(
                          event.name,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                    DataCell(Text(event.round.getRound)),
                    DataCell(Text(event.format)),
                    DataCell(Text(event.getCutoff)),
                    DataCell(Text(event.getLimit)),
                    DataCell(Text(event.getAdvanceToNextRound))
                  ]
                )).toList(),
              ),
            ),
          );
        }
        else {
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
