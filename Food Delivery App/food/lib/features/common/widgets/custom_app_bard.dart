import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadIconBtn;
  final Widget? titleWidget;
  final bool showBackButton;
  final bool showCart;
  final int cartCount;
  final VoidCallback? onLocationTap;
  final List<Widget>? actionBtn;

  const CustomAppBar({
    super.key,
    this.leadIconBtn,
    this.titleWidget,
    this.showBackButton = false,
    this.showCart = true,
    this.cartCount = 0,
    this.onLocationTap,
    this.actionBtn,
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
            icon: showBackButton
                ? Icon(Icons.arrow_back, color: Colors.black)
                : leadIconBtn ?? SizedBox(),
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
        child: titleWidget,
      ),

      actions: actionBtn,
    );
  }
}

// if (showCart)
//           Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: Stack(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: AppColors.actionBtnBg,
//                   ),
//                   child: const Padding(
//                     padding: EdgeInsets.all(8),
//                     child: Icon(
//                       Icons.shopping_bag_outlined,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//
//                 if (cartCount > 0)
//                   Positioned(
//                     right: 0,
//                     top: 0,
//                     child: Container(
//                       height: 18,
//                       width: 18,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: AppColors.primaryColor,
//                       ),
//                       child: Center(
//                         child: Text(
//                           '$cartCount',
//                           style: const TextStyle(
//                             fontSize: 10,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
