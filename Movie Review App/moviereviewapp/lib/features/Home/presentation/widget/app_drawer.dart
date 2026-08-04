import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import 'drawer_list_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
                SizedBox(height: 12),
                Text(
                  "Md Nahid",
                  style: TextStyle(
                    color: AppColors.titleTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "nahid@example.com",
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),

          DrawerListTile(
            iconData: Icons.movie_outlined,
            title: 'Movies',
            onTap: () {},
          ),
          DrawerListTile(
            iconData: Icons.calendar_today_outlined,
            title: 'Logger',
            onTap: () {},
          ),
          DrawerListTile(
            iconData: Icons.import_contacts,
            title: 'Reviews',
            onTap: () {},
          ),
          DrawerListTile(
            iconData: Icons.assignment_outlined,
            title: 'Wishlist',
            onTap: () {},
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}