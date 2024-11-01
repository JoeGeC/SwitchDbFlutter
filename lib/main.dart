import 'package:flutter/material.dart';
import 'package:switch_db/src/core/utils/injections/injections.dart';
import 'package:switch_db/src/features/games/presentation/pages/GamesPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      ),
      home: GamesPage(),
    );
  }
}
