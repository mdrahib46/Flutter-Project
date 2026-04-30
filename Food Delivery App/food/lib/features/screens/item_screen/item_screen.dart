import 'package:flutter/material.dart';
import 'package:food/features/common/widgets/custom_app_bard.dart';
import 'package:food/features/common/widgets/food_card_widget.dart';
import 'package:food/features/common/widgets/restaurantCard.dart';
import 'package:food/features/common/widgets/segment_title_widget.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/restaurent_and_item_list.dart';

import '../../common/widgets/app_action__btn.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});
  static const name = '/Item-Screen';

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        showBackButton: true,
        titleWidget: Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Burger', style: TextStyle(fontSize: 15)),
                const Icon(
                  Icons.arrow_drop_down_outlined,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
        actionBtn: [
          AppActionButton(
            icon: Icons.search_rounded,
            iconColor: AppColors.white,
            onTap: () {},
            bgColor: AppColors.actionBtnBg2,
          ),
          AppActionButton(
            onTap: () {},
            icon: Icons.equalizer,
            iconColor: AppColors.actionBtnBg,
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SegmentTitleWidget(
              title: 'Popular Burger',
              isSeeAllVisible: false,
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.75,
                crossAxisCount: 2,
              ),
              itemCount: 6,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              itemBuilder: (context, index) {
                return FoodCard(
                  foodTitle: 'Burger Ferguson',
                  restaurantTitle: 'Spicy Restaurant',
                  price: '40',
                  onTap: () {},
                  imageUrl:
                      'https://thumbs.dreamstime.com/b/tasty-burger-french-fries-fire-close-up-home-made-flames-137249900.jpg',
                );
              },
            ),

            const SizedBox(height: 16,),
            SegmentTitleWidget(title: 'Open Restaurants', isSeeAllVisible: false,),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final restaurant = RestaurantAndItemList.restaurantList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: RestaurantCard(
                    restaurantTitle: restaurant.title,
                    itemList: restaurant.itemList,
                    imageUrl: restaurant.imageUrl,
                    onTap: () {},
                  ),
                );
              },
            ),

           ],
        ),
      ),
    );
  }
}
