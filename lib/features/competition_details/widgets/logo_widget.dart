import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String url;

  const LogoWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return const SizedBox();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        url,
        height: 250,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          return child;
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const SizedBox(
              height: 250,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}