import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moviereviewapp/features/shared/presentation/widget/movie_card.dart';
import 'package:moviereviewapp/features/shared/presentation/widget/custom_appbar.dart';
import '../provider/wishlist_provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final wishlist = wishlistProvider.wishlist;

    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: true,
        title: 'Wishlist',
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))],
      ),

      body: SafeArea(
        child: wishlist.isEmpty 
          ? const Center(child: Text('Your wishlist is empty', style: TextStyle(color: Colors.white70)))
          : GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: wishlist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 8,
            childAspectRatio: 0.55,
          ),
          itemBuilder: (context, index) {
            return const MovieCard();
          },
        ),
      ),
    );
  }
}
