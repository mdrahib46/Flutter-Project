import 'package:flutter/material.dart';
import 'app/movie_review_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/services/firebase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await FirebaseService.init();

  runApp(MyApp());
}



