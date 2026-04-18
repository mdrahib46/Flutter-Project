import 'package:flutter/material.dart';
import 'package:food/features/common/widgets/custom_app_bard.dart';

import 'asdf.dart';

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
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, Aasdfa.name);
          }, child: Text('child'))
        ],
      ),
    );
  }
}
