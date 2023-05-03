import 'package:flutter/material.dart';
import 'package:funcubing/repository/competition_repository/models/models.dart';

class OrganizersListWidget extends StatelessWidget {
  const OrganizersListWidget({Key? key, required this.organizersList})
      : super(key: key);

  final List<OrganizerModel> organizersList;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
          children: organizersList.map((organizer) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person, size: 35),
            Expanded(
              child: Text(
                organizer.name,
                style: const TextStyle(fontSize: 20),
                softWrap: true,
              ),
            ),
          ],
        );
      }).toList()),
    );
  }
}
