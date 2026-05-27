import 'package:dev_venture/components/button_component.dart';
import 'package:dev_venture/theme/dark_theme.dart';
import 'package:dev_venture/theme/light_theme.dart';
import 'package:dev_venture/screens/theme_demo.dart';
import 'package:flutter/material.dart';
import 'package:dev_venture/screens/cadastro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CadastroScreen(),
    );
  }
}
