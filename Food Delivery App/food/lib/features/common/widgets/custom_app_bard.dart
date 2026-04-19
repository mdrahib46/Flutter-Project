import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final bool showBackButton;
  final bool showCart;
  final int cartCount;
  final VoidCallback? onLocationTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subTitle,
    this.showBackButton = false,
    this.showCart = true,
    this.cartCount = 0,
    this.onLocationTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,

      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.leadingIcnBtnClr,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              showBackButton ? Icons.arrow_back : Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              if (showBackButton) {
                Navigator.pop(context);
              } else {
                Scaffold.of(context).openDrawer();
              }
            },
          ),
        ),
      ),

      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (subTitle != null)
              Row(
                children: [
                  Text(
                    subTitle!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: onLocationTap,
                    child: const Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),

      actions: [
        if (showCart)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.actionBtnBg,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),

                if (cartCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          '$cartCount',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}