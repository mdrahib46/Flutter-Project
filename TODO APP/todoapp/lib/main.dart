import 'package:flutter/material.dart';

import 'core/theme/colors_schemes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: AppColorsScheme.lightColorScheme,
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: AppColorsScheme.darkColorScheme
      ),

      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('TODO App')));
  }
}
