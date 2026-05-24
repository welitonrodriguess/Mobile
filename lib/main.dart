import 'package:dev_venture/theme/dark_theme.dart';
import 'package:dev_venture/theme/light_theme.dart';
import 'package:dev_venture/screens/true_false_demo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppLightTheme.theme,
      darkTheme: AppDarkTheme.theme,
      themeMode: ThemeMode.system,
      home: const TrueFalseDemoPage(),
    );
  }
}
