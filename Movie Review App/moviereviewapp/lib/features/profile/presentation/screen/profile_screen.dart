import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_colors.dart';
import '../../../shared/presentation/widget/movie_card.dart';
import '../../../shared/presentation/widget/movie_section_header.dart';
import '../provider/profile_provider.dart';
import '../widget/movie_review_card.dart';
import '../widget/recently_watched_movie.dart';
import '../widget/profile_header.dart';
import '../widget/profile_stats_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String name = '/Profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final profile = profileProvider.userProfile;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeader(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    if (profile != null)
                      Row(
                        children: [
                          Expanded(
                            child: ProfileStatsCard(
                              title: 'Movies Watched',
                              value: profile.moviesWatched.toString(),
                              icon: Icons.movie_outlined,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ProfileStatsCard(
                              title: 'Time Spent',
                              value: profile.timeSpent,
                              icon: Icons.access_time,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 24),
                    MovieSectionHeader(
                      title: 'Favorites',
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                    _favoritesList(),
                    const SizedBox(height: 24),
                    MovieSectionHeader(
                      title: 'Recently Watched Movies',
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                    _recentlyWatchedList(),
                    const SizedBox(height: 24),
                    const MovieSectionHeader(
                      title: 'Recent Reviews',
                    ),
                    const SizedBox(height: 12),
                    const MovieReviewCard(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _favoritesList() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 12),
            child: MovieCard(),
          );
        },
      ),
    );
  }

  Widget _recentlyWatchedList() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: RecentlyWatchedMovies(
              rating: (index % 2 == 0) ? 4 : 5,
            ),
          );
        },
      ),
    );
  }
}
