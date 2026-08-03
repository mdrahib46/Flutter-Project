class Movie {
  final int id;
  final String title;
  final String? posterPath;
  final String? backDropPath;
  final String voteAverage;
  final String releaseDate;

  final List<int> genreIds;

  Movie({
    required this.id,
    required this.title,
    this.posterPath,
    this.backDropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.genreIds,
  });


  
}
