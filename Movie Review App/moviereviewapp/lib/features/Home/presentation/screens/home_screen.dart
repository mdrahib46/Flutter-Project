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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              UserGreetWidget(),
              const SizedBox(height: 20),

              MovieSectionHeader(title: "New Releases", onTap: () {}),
              const SizedBox(height: 8),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: SizedBox(width: 120, child: MovieCard()),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              MovieSectionHeader(title: "Upcoming Movies", onTap: () {}),
              const SizedBox(height: 8),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: SizedBox(width: 120, child: MovieCard()),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              MovieSectionHeader(title: "Ranked Movies", onTap: () {}),
              const SizedBox(height: 8),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: SizedBox(width: 120, child: MovieCard()),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}