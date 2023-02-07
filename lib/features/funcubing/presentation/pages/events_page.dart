import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/features/funcubing/presentation/bloc/competitions/competitions_bloc.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitionsBloc, CompetitionsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Дисциплина")),
                DataColumn(label: Text("Раунд")),
                DataColumn(label: Text("Формат")),
                DataColumn(label: Text("Катофф")),
                DataColumn(label: Text("Лимит")),
                DataColumn(label: Text("Проходят дальше")),
              ],
              rows: state.currentEvents!
                  .map(
                    (event) => DataRow(
                      cells: [
                        DataCell(
                          SizedBox(
                            width: 120,
                            child: Text(
                              event.name ?? "-",
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                        DataCell(Text(event.round?.name ?? "-")),
                        DataCell(Text(event.format ?? "-")),
                        DataCell(Text(event.cutoff ?? "-")),
                        DataCell(Text(event.timeLimit ?? "-")),
                        if (event.advanceToNextRound == null) ...[
                          const DataCell(Text('-'))
                        ] else if (event.advanceToNextRound!.isPercent) ...[
                          DataCell(Text("${event.advanceToNextRound!.value!}%"))
                        ] else ...[
                          DataCell(Text(
                              "Лучшие ${event.advanceToNextRound!.value!}"))
                        ]
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
