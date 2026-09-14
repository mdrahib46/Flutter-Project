import 'package:flutter/material.dart';
import '../../../../data/model/movie_model.dart';

class MovieDetailProvider extends ChangeNotifier {
  MovieModel? _selectedMovie;
  bool _isLoading = false;

  MovieModel? get selectedMovie => _selectedMovie;
  bool get isLoading => _isLoading;

  void selectMovie(MovieModel movie) async {
    _isLoading = true;
    _selectedMovie = movie;
    notifyListeners();

    // Mock fetching extra details
    await Future.delayed(const Duration(milliseconds: 500));
    
    _isLoading = false;
    notifyListeners();
  }
}
