import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final String value;
  final TextStyle? style;

  const InfoWidget({
    Key? key,
    required this.name,
    required this.icon,
    required this.value,
    this.style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    if (style != null) {
      textStyle = TextStyle(fontSize: 18, color: style!.color);
    } else {
      textStyle = const TextStyle(fontSize: 18);
    }
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Icon(icon, size: 20),
        Text(value, style: textStyle)
      ],
    );
  }
}
