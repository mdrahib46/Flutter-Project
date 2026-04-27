import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food/features/common/widgets/app_action__btn.dart';
import 'package:food/features/common/widgets/custom_app_bard.dart';
import 'package:food/features/common/widgets/food_card_widget.dart';
import 'package:food/features/common/widgets/segment_title_widget.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/app_strings.dart';
import 'package:food/utils/app_text_style.dart';

class RestaurantViewScreen extends StatefulWidget {
  static const String name = '/restaurant-view';
  const RestaurantViewScreen({super.key});

  @override
  State<RestaurantViewScreen> createState() => _RestaurantViewScreenState();
}

class _RestaurantViewScreenState extends State<RestaurantViewScreen> {
  bool isSelectedChip = false;
  int selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        showBackButton: true,
        actionBtn: [AppActionButton(onTap: () {})],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 300.0, viewportFraction: 1),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xff98A8B8),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star_border,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                      Text(' 4.7', style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(width: 20),
                      Icon(
                        Icons.delivery_dining,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                      Text(
                        ' Free',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 20),
                      Icon(
                        Icons.access_time_rounded,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                      Text(
                        ' 20 min',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text("Restaurant Name", style: AppTextStyles.primaryTitle),
                  Text(AppStrings.restaurantSubTitle),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            showCheckmark: false,
        
                            label: Text(
                              'Burger',
                              style: TextStyle(
                                color: selectedChipIndex == index
                                    ? AppColors.white
                                    : AppColors.textPrimaryColor,
                              ),
                            ),
        
                            selected: selectedChipIndex == index,
        
                            selectedColor: AppColors.primaryColor,
                            backgroundColor: Colors.transparent,
        
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
        
                            onSelected: (_) {
                              setState(() {
                                selectedChipIndex = index;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SegmentTitleWidget(
                    title: 'Burger (10)',
                    isSeeAllVisible: false,
                  ),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.75,
                      crossAxisCount: 2,
                    ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
