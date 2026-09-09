import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset_path.dart';
import '../../../../core/app_colors.dart';
import '../provider/bottom_nav_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.showBackButton = false,
    this.title,
    this.actions,
  });

  final bool showBackButton;
  final String? title;
  final List<Widget>? actions;

  static const double _toolbarHeight = 56;
  static const double _leadingWidth = 56;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      toolbarHeight: _toolbarHeight,
      leadingWidth: _leadingWidth,
      titleSpacing: showBackButton ? 10 : 16,
      elevation: 0,
      centerTitle: false,
      leading: showBackButton
          ? _buildBackButton(context)
          : Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: AppColors.textPrimary),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
      title: title == null
          ? Image.asset(AssetPath.textLogo, height: 40)
          : Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
      actions: actions,
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Material(
        color: AppColors.leadingBtnColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            final navProvider =
                Provider.of<BottomNavProvider>(context, listen: false);
            if (navProvider.selectedIndex != 0) {
              navProvider.navigateToHome();
            } else if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
            }
          },
          child: const Center(
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_toolbarHeight);
}
