import 'package:flutter/material.dart';


import '../features/todo/presentation/screens/todo_screen.dart';
import 'theme/colors_schemes.dart';

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

      home: ToDoScreen(),
    );
  }
}