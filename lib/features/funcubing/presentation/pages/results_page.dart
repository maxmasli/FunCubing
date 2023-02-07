import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/features/core/utils/utils.dart';
import 'package:funcubing/features/funcubing/domain/entities/result_entity.dart';
import 'package:funcubing/features/funcubing/presentation/bloc/competitions/competitions_bloc.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitionsBloc, CompetitionsState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.currentResults!.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ResultsEventItem(
                results: state.currentResults![
                    state.currentResults!.keys.toList()[index]]!,
                event: state.getEventNameById(
                    state.currentResults!.keys.toList()[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class ResultsEventItem extends StatelessWidget {
  final List<ResultEntity> results;
  final String event;

  const ResultsEventItem({Key? key, required this.results, required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(event,
              textAlign: TextAlign.start, style: const TextStyle(fontSize: 20)),
        ),
        DataTable(
          columns: const [
            DataColumn(label: Text("Место")),
            DataColumn(label: Text("Имя")),
            DataColumn(label: Text("Среднее")),
            DataColumn(label: Text("Лучшая")),
            DataColumn(label: Text("Сборки")),
          ],
          rows: results
              .map(
                (result) => DataRow(
                  cells: [
                    DataCell(SizedBox(
                        width: 30, child: Text(result.pos.toString() ?? "-"))),
                    DataCell(Text(result.name ?? '-')),
                    DataCell(Text(result.averageString)),
                    DataCell(Text(result.bestString)),
                    DataCell(
                      Row(
                        children: result.attempts!
                            .map((att) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(result.attemptToString(att)),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
