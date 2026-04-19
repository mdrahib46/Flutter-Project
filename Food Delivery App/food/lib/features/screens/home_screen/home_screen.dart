import 'package:flutter/material.dart';
import 'package:food/features/common/widgets/custom_app_bard.dart';
import 'package:food/features/screens/home_screen/widgets/category_segment_title_widget.dart';
import 'package:food/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'DELIVER TO',
        subTitle: 'Location Name',
        showBackButton: false,
        cartCount: 2,
        onLocationTap: () {},
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Hello Halal, ",
                  style: TextStyle(color: AppColors.textPrimaryColor),
                  children: [
                    TextSpan(
                      text: 'Good Afternoon',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: AppColors.textFieldIconColor,
                  ),
                  hintText: 'Search dishes, restaurants',
                  hintStyle: TextStyle(color: AppColors.hintTextColor),
                ),
              ),
              const SizedBox(height: 10),
              CategorySegmentTitleWidget(title: 'All Categories', onTap: () {}),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8)
                    ),
                    child: Image(
                      height: 80,
                      width: 80,
                      image: NetworkImage('https://img.pikbest.com/png-images/20240806/pizza-top-view-png_10703075.png!f305cw'),),),
                  Text('Pizza', style: TextStyle(fontWeight: FontWeight.w600),)
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}


