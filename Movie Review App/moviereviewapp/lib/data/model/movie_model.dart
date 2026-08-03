import 'package:moviereviewapp/domain/entity/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.voteAverage,
    required super.releaseDate,
    required super.genreIds,
    super.posterPath,
    super.backDropPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieModel(
      id: jsonData['id'] ?? jsonData['name'] ?? 'Unknown Title',
      title: jsonData['title'],
      voteAverage: jsonData['vote_average'],
      releaseDate:
          jsonData['release_date'] ??
          jsonData['first_air_date'] ??
          'Unknown Release Data',
      genreIds: List.from(jsonData['genre_ids']),
      posterPath: jsonData['poster_path'],
      backDropPath: jsonData['backdrop_path'],
    );
  }
}
