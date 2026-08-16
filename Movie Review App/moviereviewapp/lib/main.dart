import 'package:flutter/material.dart';
import 'app/movie_review_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



// Figma - https://www.figma.com/community/file/1389033578385188387/cinephiler-keep-track-and-log-movies-full-ui-pack
// Api - https://developer.themoviedb.org/reference/movie-reviews

Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}



