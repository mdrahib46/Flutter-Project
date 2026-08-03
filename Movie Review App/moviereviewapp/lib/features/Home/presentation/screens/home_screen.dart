import 'package:flutter/material.dart';
import '../../../shared/presentation/widget/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar( ),
      drawer: Drawer(),
      body: Column(children: []),
    );
  }
}


