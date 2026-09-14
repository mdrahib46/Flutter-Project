import 'package:flutter/material.dart';
import '../../../../data/model/movie_model.dart';

class WishlistProvider extends ChangeNotifier {
  final List<MovieModel> _wishlist = [];

  List<MovieModel> get wishlist => _wishlist;

  void toggleWishlist(MovieModel movie) {
    final isExist = _wishlist.any((item) => item.id == movie.id);
    if (isExist) {
      _wishlist.removeWhere((item) => item.id == movie.id);
    } else {
      _wishlist.add(movie);
    }
    notifyListeners();
  }

  bool isExist(MovieModel movie) {
    return _wishlist.any((item) => item.id == movie.id);
  }
}
