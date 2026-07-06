import 'package:dummy_bkash/presentation/screens/home/provider/home_provider.dart';
import 'package:dummy_bkash/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeProvider(),
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
