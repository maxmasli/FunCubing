import 'package:flutter/material.dart';

class InfoListWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final List<String> value;

  const InfoListWidget({
    Key? key,
    required this.name,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: value
              .map(
                (value) => Row(
                  children: [
                    Icon(icon, size: 20),
                    Text(
                      value,
                      style: const TextStyle(fontSize: 18),
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
