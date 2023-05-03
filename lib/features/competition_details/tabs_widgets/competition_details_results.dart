import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/core/widgets/error_widget.dart';
import 'package:funcubing/features/competition_details/bloc/competition_details_bloc.dart';
import 'package:funcubing/generated/locale_keys.g.dart';
import 'package:funcubing/repository/competition_repository/models/competition_result_model.dart';

class CompetitionDetailsResultsWidget extends StatelessWidget {
  const CompetitionDetailsResultsWidget({Key? key}) : super(key: key);

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
          return const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: _ResultsListWidget(),
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

class _ResultsListWidget extends StatefulWidget {
  const _ResultsListWidget({Key? key}) : super(key: key);

  @override
  State<_ResultsListWidget> createState() => _ResultsListWidgetState();
}

class _ResultsListWidgetState extends State<_ResultsListWidget> {
  final List<Item> _items = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bloc = context.read<CompetitionDetailsBloc>();
    if (bloc.state is! CompetitionDetailsLoaded) return;
    final state = bloc.state as CompetitionDetailsLoaded;
    final resultsMap = state.getResultsMap;
    for (String key in resultsMap.keys) {
      _items.add(Item(headerValue: key, expandedValue: resultsMap[key]!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 200),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _items[index].isExpanded = !isExpanded;
        });
      },
      children: _items.map((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text(LocaleKeys.position.tr())),
                DataColumn(label: Text(LocaleKeys.name.tr())),
                DataColumn(label: Text(LocaleKeys.average.tr())),
                DataColumn(label: Text(LocaleKeys.best.tr())),
                DataColumn(label: Text(LocaleKeys.attempts.tr())),
              ],
              rows: item.expandedValue
                  .map(
                    (CompetitionResultModel result) =>
                    DataRow(
                      cells: [
                        DataCell(SizedBox(
                            width: 30,
                            child: Text(result.position.toString()))),
                        DataCell(Text(result.name)),
                        DataCell(Text(result.getAverage)),
                        DataCell(Text(result.getBest)),
                        DataCell(
                          Row(
                            children: result.getAttempts
                                .map(
                                  (att) =>
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Text(att),
                                  ),
                            )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
              )
                  .toList(),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  List<CompetitionResultModel> expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });
}
