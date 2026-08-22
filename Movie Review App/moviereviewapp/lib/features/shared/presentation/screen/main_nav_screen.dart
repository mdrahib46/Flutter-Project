import 'package:flutter/material.dart';
import 'package:moviereviewapp/features/wishlist/presentation/screen/wishlist_screen.dart';

import '../../../../core/app_colors.dart';
import '../../../Home/presentation/screens/home_screen.dart';
import '../../../search/presentation/screen/search_screen.dart';

class MainNavScreen extends StatefulWidget {
  static const String name = '/bottom-nav';
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    WishlistScreen(),
    HomeScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.iconPrimary,
        currentIndex: _selectedIndex,
        backgroundColor: AppColors.drawerBg,
        onTap: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            activeIcon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Wishlist',
            activeIcon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
