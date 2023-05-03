import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funcubing/core/widgets/error_widget.dart';
import 'package:funcubing/features/competition_details/bloc/competition_details_bloc.dart';
import 'package:funcubing/features/competition_details/widgets/member_card_widget.dart';
import 'package:funcubing/generated/locale_keys.g.dart';

class CompetitionDetailsMembersWidget extends StatelessWidget {
  const CompetitionDetailsMembersWidget({Key? key}) : super(key: key);

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
          final membersList = state.membersList;
          return ListView.builder(
              itemCount: membersList.length,
              itemBuilder: (BuildContext context, int index) {
                return MemberCardWidget(
                  competitionMemberModel: membersList[index],
                );
              });
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
