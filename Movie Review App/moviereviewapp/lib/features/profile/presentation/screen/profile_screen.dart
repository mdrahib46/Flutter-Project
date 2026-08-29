import 'package:flutter/material.dart';
import 'package:moviereviewapp/features/profile/presentation/widget/recently_wathched_movie.dart';

import '../../../../app/asset_path.dart';
import '../../../auth/presentation/widget/GlassContainerBG.dart';
import '../../../shared/presentation/widget/movie_card.dart';
import '../../../shared/presentation/widget/movie_section_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                // ================= PROFILE HEADER =================
                GlassContainerBG(
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        // Cover Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            height: 180,
                            width: double.infinity,
                            child: Image.asset(
                              AssetPath.dummyImage2,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Profile Information
                        Positioned(
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const CircleAvatar(
                                radius: 56,
                                backgroundImage: AssetImage(
                                  AssetPath.dummyImage,
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Md Rahib',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    const SizedBox(height: 2),

                                    const Text(
                                      '@rahib086',
                                      style: TextStyle(fontSize: 14),
                                    ),

                                    const SizedBox(height: 6),

                                    Row(
                                      children: [
                                        const Text(
                                          '500',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Text('Followers'),

                                        const SizedBox(width: 20),

                                        const Text(
                                          '420',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Text('Following'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // ================= STATISTICS =================
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: GlassContainerBG(
                        height: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: const [
                                Icon(
                                  Icons.movie_creation_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  'Movie Watched',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 4),

                            const Text(
                              '2000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: GlassContainerBG(
                        height: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: const [
                                Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  'Time Spent',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 4),

                            const Text(
                              '24m 30d 23h',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ================= FAVOURITE =================
                MovieSectionHeader(title: 'Favourite', onTap: () {}),

                const SizedBox(height: 8),

                SizedBox(
                  height: 190,
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
                ),

                const SizedBox(height: 16),


                MovieSectionHeader(title: 'Recently Watched', onTap: () {}),

                const SizedBox(height: 8),

                SizedBox(
                  height: 190,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: RecentlyWatchedMovies(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
