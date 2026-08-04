import 'package:flutter/material.dart';
import 'package:moviereviewapp/core/app_colors.dart';


class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key, required this.iconData,  required this.title, required this.onTap,
  });

  final String title;
  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData, color: AppColors.iconPrimary,),
      title: Text(title, style: TextStyle(color: AppColors.textPrimary),),
      onTap: onTap,
    );
  }
}