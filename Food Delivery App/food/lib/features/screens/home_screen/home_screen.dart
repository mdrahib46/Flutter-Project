import 'package:flutter/material.dart';
import 'package:food/features/common/widgets/app_action__btn.dart';
import 'package:food/features/common/widgets/custom_app_bard.dart';
import 'package:food/features/common/widgets/segment_title_widget.dart';
import 'package:food/features/screens/home_screen/widgets/food_category_item_card.dart';
import 'package:food/features/common/widgets/restaurantCard.dart';
import 'package:food/features/screens/item_screen/item_screen.dart';
import 'package:food/features/screens/restaurent_view/restaurant_view.dart';
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
        leadIconBtn: Icon(Icons.menu),
        titleWidget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DELIVER TO',
              style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Halal lab office', style: TextStyle(fontSize: 12)),
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.arrow_drop_down_outlined),
                ),
              ],
            ),
          ],
        ),
        actionBtn: [
          AppActionButton(isFoodCart: true, onTap: (){},)
        ],
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
              SegmentTitleWidget(title: 'All Categories', onTap: () {}),

              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final itemCategory =
                        RestaurantAndItemList.categoryList[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: FoodCategoryItemCard(
                        imageUrl: itemCategory.imageUrl,
                        cardTitle: itemCategory.title,
                        onTap: () {
                          Navigator.pushNamed(context, ItemScreen.name);
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),
              SegmentTitleWidget(
                title: 'Open Restaurants',
                onTap: () {},
              ),

              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final restaurant =
                      RestaurantAndItemList.restaurantList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RestaurantCard(
                      restaurantTitle: restaurant.title,
                      itemList: restaurant.itemList,
                      imageUrl: restaurant.imageUrl, onTap: () {
                        Navigator.pushNamed(context, RestaurantViewScreen.name);
                    },
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


