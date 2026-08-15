import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../home/presentation/screen/home_screen.dart';
import '../provider/main_bottom_nav_provider.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final BottomNavProvider _bottomNavProvider = BottomNavProvider();

  final List<Widget> _screens = [
    const HomeScreen(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: _bottomNavProvider)],
      child: Consumer<BottomNavProvider>(
        builder: (context, _, _) {
          return Scaffold(
            body: _screens[_bottomNavProvider.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _bottomNavProvider.currentIndex,

              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,

              showSelectedLabels: true,
              showUnselectedLabels: true,

              onTap: _bottomNavProvider.changeIndex,

              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border),
                  activeIcon: Icon(Icons.bookmark),
                  label: 'Saved',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.confirmation_num_outlined),
                  activeIcon: Icon(Icons.confirmation_num),
                  label: 'Bookings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet_outlined),
                  activeIcon: Icon(Icons.account_balance_wallet),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Account',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
