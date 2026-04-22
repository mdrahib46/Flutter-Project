import 'package:flutter/material.dart';
import 'package:food/features/common/widgets/custom_app_bard.dart';


class RestaurantView extends StatefulWidget {
  const RestaurantView({super.key});

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Restaurant View'),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
