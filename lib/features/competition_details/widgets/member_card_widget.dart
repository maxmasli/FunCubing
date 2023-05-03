import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funcubing/core/utils/utils.dart';
import 'package:funcubing/features/competitor_details/view/competitor_details_page.dart';
import 'package:funcubing/generated/locale_keys.g.dart';
import 'package:funcubing/repository/competition_repository/models/competition_member_model.dart';

class MemberCardWidget extends StatelessWidget {
  const MemberCardWidget({Key? key, required this.competitionMemberModel})
      : super(key: key);

  final CompetitionMemberModel competitionMemberModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (competitionMemberModel.fcId != null) {
          Navigator.of(context).pushNamed(CompetitorDetailsPage.route(),
              arguments: competitionMemberModel.fcId);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(LocaleKeys.can_not_open_competitor_info.tr()),
          ));
        }
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              competitionMemberModel.name,
              style: const TextStyle(fontSize: 20),
            ),
            Wrap(
              children: competitionMemberModel.eventIds.map((eventId) {
                final asset = getAssetNameById(eventId);
                if (asset != null) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: SvgPicture.asset(
                      asset,
                      width: 25,
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!, // SvgTheme dont work :(
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
