import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/app_colors.dart';
import '../../../app/provider/theme_mode_provider.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: isDark
              ? Colors.grey.withAlpha(80)
              : AppColors.lightBg.withAlpha(80),
          child: const Text('👨‍💼', style: TextStyle(fontSize: 22)),
        ),

        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Good morning ',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark
                        ? AppColors.lightBg
                        : AppColors.darkTextPrimary,
                  ),
                ),
                const Text('👋', style: TextStyle(fontSize: 13)),
              ],
            ),

            const SizedBox(height: 2),

            Text(
              'Monirujjaman Nahid',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.lightBg : AppColors.darkTextPrimary,
              ),
            ),
          ],
        ),

        const Spacer(),

        IconButton(
          onPressed: () {
            context.read<ThemeModeProvider>().toggleTheme();
          },
          icon: Icon(
            isDark ? Icons.light_mode : Icons.dark_mode,
            color: isDark ? AppColors.accent : AppColors.lightBg,
          ),
        ),

        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark
                      ? AppColors.lightBg
                      : AppColors.darkTextPrimary,
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: isDark
                      ? AppColors.lightBg
                      : AppColors.darkTextPrimary,
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
