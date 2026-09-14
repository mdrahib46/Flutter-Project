import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/widget/custom_appbar.dart';
import '../../../shared/presentation/widget/movie_card.dart';
import '../../../shared/presentation/widget/movie_section_header.dart';
import '../widget/upcomming_movie_card.dart';
import '../provider/search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(showBackButton: true, title: 'Search'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _searchController,
                  onChanged: (value) => searchProvider.searchMovies(value),
                  decoration: const InputDecoration(
                    hintText: 'Search....',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 16),
                
                if (searchProvider.isSearching)
                  const Center(child: CircularProgressIndicator())
                else if (searchProvider.searchResults.isNotEmpty)
                  ...[
                    const MovieSectionHeader(title: 'Search Results'),
                    const SizedBox(height: 8),
                    _movieList(searchProvider.searchResults.length),
                    const SizedBox(height: 16),
                  ],

                MovieSectionHeader(title: 'Trending this month', onTap: () {}),
                const SizedBox(height: 8),
                _movieList(searchProvider.trendingMovies.length),
                const SizedBox(height: 16),
                
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: AlignmentGeometry.topLeft,
                      end: AlignmentGeometry.bottomRight,
                      colors: [
                        Colors.white.withAlpha(99),
                        Colors.white.withAlpha(20),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(40),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      spacing: 8,
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedPlayCircle02,
                          color: Colors.white,
                          size: 60,
                        ),
                        Text('Brows All Movies', style: TextStyle(fontSize: 26)),
                        Spacer(),
                        Icon(Icons.arrow_forward, size: 40, color: Colors.white),
                      ],
                    ),
                  ),
                ),
            
                const SizedBox(height: 16),
            
                MovieSectionHeader(title: 'Upcoming Movies', onTap: () {}),
                const Text('Add to the wishlist'),
                const SizedBox(height: 16,),
            
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: searchProvider.upcomingMovies.isNotEmpty ? searchProvider.upcomingMovies.length : 5,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: UpcomingMovieCard(),
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

  Widget _movieList(int count) {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count > 0 ? count : 5,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(right: 12),
          child: SizedBox(width: 120, child: MovieCard()),
        ),
      ),
    );
  }
}


