import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_colors.dart';
import '../../../auth/presentation/provider/auth_provider.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../../logger/presentation/screen/logger_screen.dart';
import '../../../shared/presentation/provider/bottom_nav_provider.dart';
import 'drawer_list_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.user;
    
    return Drawer(
      backgroundColor: AppColors.drawerBg,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage("assets/images/img.png"),
                ),
                SizedBox(height: 12),
                Text(
                  authProvider.username ?? user?.displayName ?? "User",
                  style: TextStyle(
                    color: AppColors.titleTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user?.email ?? "email@example.com",
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),

          DrawerListTile(
            iconData: Icons.movie_outlined,
            title: 'Movies',
            onTap: () {
              Navigator.pop(context);
              context.read<BottomNavProvider>().setSelectedIndex(0);
            },
          ),
          DrawerListTile(
            iconData: Icons.calendar_today_outlined,
            title: 'Logger',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, LoggerScreen.name);
            },
          ),
          DrawerListTile(
            iconData: Icons.import_contacts,
            title: 'Reviews',
            onTap: () {},
          ),
          DrawerListTile(
            iconData: Icons.assignment_outlined,
            title: 'Wishlist',
            onTap: () {
              Navigator.pop(context);
              context.read<BottomNavProvider>().setSelectedIndex(2);
            },
          ),
          DrawerListTile(
            iconData: Icons.format_list_numbered_sharp,
            title: 'List',
            onTap: () {},
          ),
          const SizedBox(height: 32),
          DrawerListTile(
            iconData: Icons.logout_rounded,
            title: 'Logout',
            onTap: () {
              context.read<AuthProvider>().logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.name,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}