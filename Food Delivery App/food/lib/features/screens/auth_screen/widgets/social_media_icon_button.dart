import 'package:flutter/material.dart';


class SocialMediaIconButton extends StatelessWidget {
  const SocialMediaIconButton({
    super.key, required this.color, required this.imgPath, required this.onTap,
  });

  final Color color;
  final String imgPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(100),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image(image: AssetImage(imgPath),),
        ),
      ),
    );
  }
}