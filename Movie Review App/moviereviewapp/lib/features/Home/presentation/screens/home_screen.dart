import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/screen/movie_list_screen.dart';
import '../../../shared/presentation/widget/custom_appbar.dart';
import '../../../shared/presentation/widget/movie_card.dart';
import '../../../shared/presentation/widget/movie_section_header.dart';
import '../widget/app_drawer.dart';
import '../widget/user_greet.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: SafeArea(
        child: homeProvider.isLoading 
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // User Greeting
              UserGreetWidget(),

              const SizedBox(height: 20),

              // New Releases
              MovieSectionHeader(
                title: 'New Releases',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MovieListScreen.name,
                    arguments: {
                      'title': 'New Releases',
                      'movies': homeProvider.newReleases,
                    },
                  );
                },
              ),

              const SizedBox(height: 10),

              _movieList(homeProvider.newReleases.length),

              const SizedBox(height: 20),

              // Upcoming Movies
              MovieSectionHeader(
                title: 'Upcoming Movies',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MovieListScreen.name,
                    arguments: {
                      'title': 'Upcoming Movies',
                      'movies': homeProvider.upcomingMovies,
                    },
                  );
                },
              ),

              const SizedBox(height: 10),

              _movieList(homeProvider.upcomingMovies.length),

              const SizedBox(height: 20),

              // Ranked Movies
              MovieSectionHeader(
                title: 'Ranked Movies',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MovieListScreen.name,
                    arguments: {
                      'title': 'Ranked Movies',
                      'movies': homeProvider.rankedMovies,
                    },
                  );
                },
              ),

              const SizedBox(height: 10),

              _movieList(homeProvider.rankedMovies.length),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _movieList(int count) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count > 0 ? count : 5, // Fallback to 5 dummy items if empty
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 12),
            child: MovieCard(),
          );
        },
      ),
    );
  }
}