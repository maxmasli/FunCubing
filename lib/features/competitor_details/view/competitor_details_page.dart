import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funcubing/core/utils/utils.dart';
import 'package:funcubing/core/widgets/error_widget.dart';
import 'package:funcubing/features/competitor_details/bloc/competitor_details_bloc.dart';
import 'package:funcubing/generated/locale_keys.g.dart';

class CompetitorDetailsPage extends StatefulWidget {
  const CompetitorDetailsPage({Key? key}) : super(key: key);

  @override
  State<CompetitorDetailsPage> createState() => _CompetitorDetailsPageState();

  static String route() {
    return '/competitions/details/competitor';
  }
}

class _CompetitorDetailsPageState extends State<CompetitorDetailsPage> {
  late CompetitorDetailsBloc _competitorDetailsBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final fcIdArgument = (ModalRoute.of(context)?.settings.arguments) as String;
    _competitorDetailsBloc = CompetitorDetailsBloc(fcId: fcIdArgument)
      ..add(CompetitorGetDetails());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: _competitorDetailsBloc, child: const _CompetitorDetailsWidget());
  }
}

class _CompetitorDetailsWidget extends StatelessWidget {
  const _CompetitorDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitorDetailsBloc, CompetitorDetailsState>(
      builder: (context, state) {
        final bloc = context.read<CompetitorDetailsBloc>();
        if (state is CompetitorDetailsLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is CompetitorDetailsLoaded) {
          return Scaffold(
            appBar: AppBar(
                title: Text(
              state.competitorModel.name,
            )),
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${state.competitorModel.name} ${state.competitorModel.fcId}",
                          style: const TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    if (state.competitorModel.personalRecords != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              LocaleKeys.current_personal_records.tr(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                width: MediaQuery.of(context).size.width,
                              ),
                              child: DataTable(
                                columns: [
                                  DataColumn(
                                      label: Text(LocaleKeys.event.tr())),
                                  DataColumn(label: Text(LocaleKeys.best.tr())),
                                  DataColumn(
                                      label: Text(LocaleKeys.average.tr())),
                                ],
                                rows:
                                    state.competitorModel.personalRecords!.map(
                                  (pr) {
                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          SvgPicture.asset(
                                            getAssetNameById(pr.event)!,
                                            width: 35,
                                            height: 35,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .color,
                                          ),
                                        ),
                                        DataCell(Text(pr.getSingle)),
                                        DataCell(Text(pr.getAverage)),
                                      ],
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: InternetErrorWidget(
              message: LocaleKeys.something_went_wrong.tr(),
              onPressed: () {
                bloc.add(CompetitorGetDetails());
              },
            ),
          );
        }
      },
    );
  }
}
