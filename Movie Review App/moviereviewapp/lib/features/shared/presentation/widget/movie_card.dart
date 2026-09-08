import 'package:flutter/material.dart';
import 'package:moviereviewapp/features/movie_screen/presentation/screen/movie_screen.dart';
import '../../../../app/asset_path.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => _onTapMovieScreen(context),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(AssetPath.dummyImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'The Boy and the Heron',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapMovieScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MovieScreen()),
    );
  }
}
