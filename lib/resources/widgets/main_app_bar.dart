import 'package:flutter/material.dart';
import '../assets/colour_pallete.dart';

AppBar mainAppBar(BuildContext context){
  return AppBar(
    title: Image.asset('lib/resources/assets/images/vida-coletiva-logo.png', height: 40),
    backgroundColor: AppColors.primaryOrange,
    actions: [
      IconButton(
        icon: const Icon(Icons.search),
        color: AppColors.white,
        onPressed: (){},
      ),
      IconButton(
        icon: const Icon(Icons.notifications_none_outlined),
        color: AppColors.white,
        onPressed: (){},
      ),
      IconButton(
        icon: const Icon(Icons.account_circle_outlined),
        color: AppColors.white,
        onPressed: (){},
      ),
    ],
  );
}