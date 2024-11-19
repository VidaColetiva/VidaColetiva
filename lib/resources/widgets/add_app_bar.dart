import 'package:flutter/material.dart';
import '../assets/colour_pallete.dart';


AppBar addAppBar(BuildContext context, String name){
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.close),
      iconSize: MediaQuery.of(context).size.height/25,
      color: AppColors.white,
      onPressed: (){Navigator.pop(context);},
    ),
    toolbarHeight: MediaQuery.of(context).size.height/9,
    title: Text(
      'Criar um $name',
      style: TextStyle(
        color: AppColors.white,
        fontSize: MediaQuery.of(context).size.height/35,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: AppColors.primaryOrange,
    actions: [
      IconButton(
        icon: const Icon(Icons.check),
        iconSize: MediaQuery.of(context).size.height/25,
        color: AppColors.white,
        onPressed: (){},
      ),

    ],
  );
}