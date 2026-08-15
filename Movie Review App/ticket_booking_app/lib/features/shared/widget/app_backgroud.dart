import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';
import '../../../app/asset_path.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: isDark
                ? AppColors.primaryDark
                : AppColors.primary,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                AssetPath.mapPng,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}