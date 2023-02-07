import 'package:flutter/material.dart';
import 'package:funcubing/app.dart';
import 'package:funcubing/di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}
