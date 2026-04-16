import 'package:flutter/material.dart';
import 'package:food/utils/image_path.dart';


class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key, required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image(
            image: AssetImage(AppImages.authBackground),
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
            top: 142,
            left: 0,
            right: 0,
            child: child)
      ],
    );
  }
}