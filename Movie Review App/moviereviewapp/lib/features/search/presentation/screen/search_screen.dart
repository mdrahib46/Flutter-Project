import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:moviereviewapp/features/shared/presentation/widget/movie_section_header.dart';

import '../../../shared/presentation/widget/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search....!',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16),
              MovieSectionHeader(title: 'Trending this month', onTap: () {}),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 8,
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedPlayCircle02,
                        color: Colors.white,
                        size: 60,
                      ),
                      Text('Brows All Movies', style: TextStyle(fontSize: 26),),
                      const Spacer(),
                      Icon(Icons.arrow_forward, size: 40, color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
