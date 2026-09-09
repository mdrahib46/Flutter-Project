import 'package:flutter/material.dart';
import 'package:moviereviewapp/features/profile/presentation/screen/profile_screen.dart';
import 'package:moviereviewapp/features/wishlist/presentation/screen/wishlist_screen.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_colors.dart';
import '../../../Home/presentation/screens/home_screen.dart';
import '../../../search/presentation/screen/search_screen.dart';
import '../provider/bottom_nav_provider.dart';

class MainNavScreen extends StatefulWidget {
  static const String name = '/bottom-nav';
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomNavProvider>(context);

    return PopScope(
      canPop: navProvider.selectedIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (navProvider.selectedIndex != 0) {
          navProvider.navigateToHome();
        }
      },
      child: Scaffold(
        body: _screens[navProvider.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.accent,
          unselectedItemColor: AppColors.iconPrimary,
          currentIndex: navProvider.selectedIndex,
          backgroundColor: AppColors.drawerBg,
          onTap: (index) {
            navProvider.setSelectedIndex(index);
          },
          items: const [
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
      ),
    );
  }
}
