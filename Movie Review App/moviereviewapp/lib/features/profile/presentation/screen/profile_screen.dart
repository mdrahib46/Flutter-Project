import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset_path.dart';
import '../../../../core/app_colors.dart';
import '../../../shared/presentation/provider/bottom_nav_provider.dart';
import '../../../shared/presentation/widget/movie_card.dart';
import '../../../shared/presentation/widget/movie_section_header.dart';
import '../widget/movie_review_card.dart';
import '../widget/recently_watched_movie.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String name = '/Profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _profileHeader(context),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _statsSection(),
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

  Widget _profileHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.blue.withOpacity(0.5), width: 2),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1B3A4B),
            Color(0xFF001C29),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            // Banner
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 180,
              child: Image.asset(
                AssetPath.splashBanner,
                fit: BoxFit.cover,
              ),
            ),
            // Gradient on banner
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 180,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Back Button
            Positioned(
              top: 16,
              left: 16,
              child: InkWell(
                onTap: () {
                  final navProvider =
                      Provider.of<BottomNavProvider>(context, listen: false);
                  if (navProvider.selectedIndex != 0) {
                    navProvider.navigateToHome();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                ),
              ),
            ),

            // Profile Image (Centered overlapping banner and bottom section)
            Positioned(
              top: 120,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF001C29), width: 4),
                ),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(AssetPath.dummyImage2),
                ),
              ),
            ),

            // User Info (Positioned next to and below the overlap)
            Positioned(
              bottom: 25,
              left: 130,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Dilhara Sannasgala',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '@dilhara24',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _followInfo('100', 'Followers'),
                      const SizedBox(width: 16),
                      _followInfo('120', 'Following'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _followInfo(String count, String label) {
    return Row(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _statsSection() {
    return Row(
      children: [
        Expanded(
          child: _statCard('Movies Watched', '2000', Icons.movie_outlined),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _statCard('Time Spent', '24m 30d 23h', Icons.access_time),
        ),
      ],
    );
  }

  Widget _statCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF385263).withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white70, size: 16),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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
