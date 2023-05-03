import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class SelectableHtml extends StatelessWidget {
  const SelectableHtml({Key? key, required this.html}) : super(key: key);

  final String html;

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(children: [
        WidgetSpan(
          child: HtmlWidget(
            textStyle: const TextStyle(fontSize: 18),
            html,
          ),
        ),
      ]),
    );
  }
}
