import 'package:flutter/material.dart';
import 'package:food/my_app.dart';
import 'package:provider/provider.dart';

import 'provider/ onBoardingProvider.dart';

// https://www.figma.com/design/j8MRgCBeBKYNC1NkAGGX5e/Food-Delivery-App--Community-?node-id=601-477&t=aoHQw4NrX2xtrNtG-0

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> OnboardingProvider()),
  ],
  child: const MyApp()));
}

