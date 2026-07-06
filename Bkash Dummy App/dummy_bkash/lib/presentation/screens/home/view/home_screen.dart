
import 'package:dummy_bkash/core/asset_image_path.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../widget/home_app_bar.dart';
import '../widget/menu_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: HomeAppBar(),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          MenuGrid(),
          SizedBox(height: 16),
          Image.asset(AssetImagePath.offerBannerImgPng),
        ],
      ),
    );
  }
}
