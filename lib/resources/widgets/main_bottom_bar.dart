
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';

Widget mainBottomBar(BuildContext context, int selectedIndex){

  Widget activeIcon(IconData icon){
    return Icon(
      icon,
      color: AppColors.white,
      size: 32,
    );
  }

  Widget defaultIcon(IconData icon){
    return Icon(
      icon,
      color: AppColors.white,
      size: 32,
    );
  }

  return ConvexAppBar(
    // height: MediaQuery.of(context).size.height/10,
    backgroundColor: AppColors.primaryOrange,
    activeColor: AppColors.primaryGreen,
    items: [
      TabItem(
        icon: defaultIcon(Icons.home_outlined),
        activeIcon: activeIcon(Icons.home_outlined),
      ),
      TabItem(
        icon: defaultIcon(Icons.text_snippet_outlined),
        activeIcon: activeIcon(Icons.text_snippet_outlined),
      ),
    ],
  );
}

