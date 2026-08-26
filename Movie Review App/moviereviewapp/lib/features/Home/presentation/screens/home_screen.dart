import 'package:flutter/material.dart';

import '../../../shared/presentation/widget/custom_appbar.dart';
import '../../../shared/presentation/widget/movie_card.dart';
import '../../../shared/presentation/widget/movie_section_header.dart';
import '../widget/app_drawer.dart';
import '../widget/user_greet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                onTap: () {},
              ),

              const SizedBox(height: 10),

              _movieList(),

              const SizedBox(height: 20),

              // Upcoming Movies
              MovieSectionHeader(
                title: 'Upcoming Movies',
                onTap: () {},
              ),

              const SizedBox(height: 10),

              _movieList(),

              const SizedBox(height: 20),

              // Ranked Movies
              MovieSectionHeader(
                title: 'Ranked Movies',
                onTap: () {},
              ),

              const SizedBox(height: 10),

              _movieList(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _movieList() {
    return SizedBox(
      height: 170,
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
}