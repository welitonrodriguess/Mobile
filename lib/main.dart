import 'package:flutter/material.dart';

import 'package:dev_venture/theme/dark_theme.dart';
import 'package:dev_venture/theme/light_theme.dart';

import 'package:dev_venture/screens/theme_demo.dart';
import 'package:dev_venture/screens/activities_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Venture',

      theme: AppLightTheme.theme,
      darkTheme: AppDarkTheme.theme,
      themeMode: ThemeMode.system,

      // TELA INICIAL
      home: const MyHomePage(title: 'Dev Venture'),

      // ROTAS
      routes: {
        '/activities': (context) => ActivitiesScreen(),
        '/theme-demo': (context) => const ThemeDemoPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),

        actions: [
          IconButton(
            tooltip: 'Open theme demo',

            icon: const Icon(Icons.palette),

            onPressed: () {
              Navigator.pushNamed(context, '/theme-demo');
            },
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Text(
              'Tela inicial do projeto',
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/activities');
              },

              child: const Text(
                'Abrir Lista de Atividades',
              ),
            ),
          ],
        ),
      ),
    );
  }
}