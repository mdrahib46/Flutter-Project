import 'package:flutter/material.dart';
import 'package:food/features/common/widgets/custom_app_bard.dart';
import 'package:food/features/screens/home_screen/widgets/category_segment_title_widget.dart';
import 'package:food/features/screens/home_screen/widgets/food_category_item_card.dart';
import 'package:food/features/screens/home_screen/widgets/restaurantCard.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/restaurent_and_item_list.dart';

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
                  style: TextStyle(color: AppColors.textSecondaryColor),
                  children: [
                    TextSpan(
                      text: 'Good Afternoon',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondaryColor,
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

              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final itemCategory = RestaurantAndItemList.categoryList[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: FoodCategoryItemCard(
                        imageUrl: itemCategory.imageUrl,
                        cardTitle: itemCategory.title,
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),
              CategorySegmentTitleWidget(
                title: 'Open Restaurants',
                onTap: () {},
              ),

              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final restaurant = RestaurantAndItemList.restaurantList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RestaurantCard(
                      restaurantTitle: restaurant.title,
                      itemList: restaurant.itemList, imageUrl: restaurant.imageUrl,
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
