import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:funcubing/generated/locale_keys.g.dart';

class InternetErrorWidget extends StatelessWidget {
  const InternetErrorWidget({Key? key, required this.message, required this.onPressed})
      : super(key: key);

  final String message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message,
              style: const TextStyle(fontSize: 18)),
          TextButton(
            onPressed: onPressed,
            child: Text(LocaleKeys.try_again.tr()),
          )
        ],
      ),
    );
  }
}
