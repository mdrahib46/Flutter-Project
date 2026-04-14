
import 'package:flutter/material.dart';

class OnBoardingScreenWidget extends StatelessWidget {
  const OnBoardingScreenWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });

  final String imagePath, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage(imagePath), width: 360),
        Text(
          title,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }


}
