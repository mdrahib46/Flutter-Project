import 'package:flutter/material.dart';

import '../../../../app/asset_path.dart';
import '../../../../core/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.showBackButton = false, this.title});

  final bool showBackButton;
  final String? title;

  static const double _toolbarHeight = 40;
  static const double _leadingWidth = 56;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: _toolbarHeight,
      leadingWidth: _leadingWidth,
      titleSpacing: 0,
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
          ? Image.asset(AssetPath.textLogo, height: 48)
          : Text(title!, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Material(
        color: AppColors.leadingBtnColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => Navigator.of(context).pop(),
          child: const Center(
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_toolbarHeight);
}
