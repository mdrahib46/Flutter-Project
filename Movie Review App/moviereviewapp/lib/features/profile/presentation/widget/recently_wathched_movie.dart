import 'package:flutter/material.dart';

import '../../../shared/presentation/widget/movie_card.dart';

class RecentlyWatchedMovies extends StatelessWidget {
  const RecentlyWatchedMovies({super.key, this.rating = 4, this.onCommentTap});

  final int rating;
  final VoidCallback? onCommentTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Card
          const MovieCard(),

          const SizedBox(height: 6),

          // Rating + Comment
          Row(
            children: [
              // Stars
              ...List.generate(
                5,
                (index) => Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 15,
                ),
              ),

              const Spacer(),

              // Comment Button
              GestureDetector(
                onTap: onCommentTap,
                child: const Icon(
                  Icons.message_outlined,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
