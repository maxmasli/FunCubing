import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funcubing/features/core/utils/utils.dart';
import 'package:funcubing/features/funcubing/domain/entities/competitor_entity.dart';
import 'package:funcubing/features/funcubing/presentation/bloc/competitions/competitions_bloc.dart';

class RegistrationsPage extends StatelessWidget {
  const RegistrationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitionsBloc, CompetitionsState>(
      builder: (context, state) {
        if (state.currentCompetitors != null) {
          return ListView.builder(
            itemCount: state.currentCompetitors!.length,
            itemBuilder: (context, index) {
              return RegistrationCardView(
                competitorEntity: state.currentCompetitors![index],
              );
            },
          );
        } else {
          return const Text("ERROR");
        }
      },
    );
  }
}

class RegistrationCardView extends StatelessWidget {
  final CompetitorEntity competitorEntity;

  const RegistrationCardView({Key? key, required this.competitorEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            competitorEntity.name ?? "",
            style: const TextStyle(fontSize: 18),
          ),
          if (competitorEntity.eventIds != null &&
              competitorEntity.eventIds!.isNotEmpty)
            Wrap(
              children: competitorEntity.eventIds!.map((e) {
                final asset = getAssetNameById(e);
                if (asset != null) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: SvgPicture.asset(
                      getAssetNameById(e) ?? "",
                      width: 25,
                      //color like text
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }).toList(),
            )
        ],
      ),
    );
  }
}
