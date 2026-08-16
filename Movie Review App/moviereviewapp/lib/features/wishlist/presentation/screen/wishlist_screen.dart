import 'package:flutter/material.dart';
import 'package:moviereviewapp/features/shared/presentation/widget/movie_card.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))],
      ),

      body: SafeArea(
        child:GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 8,
            childAspectRatio: 0.55,
          ),
          itemBuilder: (context, index) {
            return MovieCard();
          },
        ),
      ),
    );
  }
}
