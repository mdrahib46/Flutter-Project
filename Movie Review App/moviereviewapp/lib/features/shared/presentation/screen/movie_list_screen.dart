import 'package:flutter/material.dart';
import '../../../../data/model/movie_model.dart';
import '../widget/movie_card.dart';
import '../widget/custom_appbar.dart';

class MovieListScreen extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;

  const MovieListScreen({
    super.key,
    required this.title,
    required this.movies,
  });

  static const String name = '/movie-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        showBackButton: true,
      ),
      body: SafeArea(
        child: movies.isEmpty && title != 'Dummy List' // Added condition for dummy data testing
            ? const Center(
                child: Text(
                  'No movies found',
                  style: TextStyle(color: Colors.white70),
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: movies.isNotEmpty ? movies.length : 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  return const MovieCard();
                },
              ),
      ),
    );
  }
}
