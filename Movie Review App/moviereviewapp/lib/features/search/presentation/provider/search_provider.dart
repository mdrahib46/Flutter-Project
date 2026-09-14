import 'package:flutter/material.dart';
import '../../../../data/model/movie_model.dart';

class SearchProvider extends ChangeNotifier {
  List<MovieModel> _searchResults = [];
  List<MovieModel> _trendingMovies = [];
  List<MovieModel> _upcomingMovies = [];
  bool _isSearching = false;

  List<MovieModel> get searchResults => _searchResults;
  List<MovieModel> get trendingMovies => _trendingMovies;
  List<MovieModel> get upcomingMovies => _upcomingMovies;
  bool get isSearching => _isSearching;

  void searchMovies(String query) async {
    if (query.isEmpty) {
      _searchResults = [];
      _isSearching = false;
      notifyListeners();
      return;
    }

    _isSearching = true;
    notifyListeners();

    // Mocking search
    await Future.delayed(const Duration(milliseconds: 500));
    
    _isSearching = false;
    notifyListeners();
  }
}
