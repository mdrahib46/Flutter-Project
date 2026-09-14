import 'package:flutter/material.dart';
import '../../../../data/model/movie_model.dart';

class HomeProvider extends ChangeNotifier {
  List<MovieModel> _newReleases = [];
  List<MovieModel> _upcomingMovies = [];
  List<MovieModel> _rankedMovies = [];
  bool _isLoading = false;

  List<MovieModel> get newReleases => _newReleases;
  List<MovieModel> get upcomingMovies => _upcomingMovies;
  List<MovieModel> get rankedMovies => _rankedMovies;
  bool get isLoading => _isLoading;

  HomeProvider() {
    _fetchHomeData();
  }

  Future<void> _fetchHomeData() async {
    _isLoading = true;
    notifyListeners();

    // Mocking data for now. In real app, this would call a repository.
    await Future.delayed(const Duration(seconds: 1));
    
    // Fill with some dummy data if needed, or keep empty for now as requested.
    // Usually, you'd fetch from TMDB here.
    
    _isLoading = false;
    notifyListeners();
  }
}
