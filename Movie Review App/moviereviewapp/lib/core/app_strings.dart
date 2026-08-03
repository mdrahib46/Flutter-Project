import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppStrings {
  static String get authorizationToken => dotenv.env['TMDB_BEARER_TOKEN']!;
  static String get baseUrl => dotenv.env['TMDB_BASE_URL']!;
  static String get imageBaseUrl => dotenv.env['TMDB_IMAGE_BASE_URL']!;
}
