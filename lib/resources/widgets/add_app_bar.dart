import 'package:flutter/material.dart';
import '../assets/colour_pallete.dart';

AppBar addAppBar(BuildContext context, String title,
    {void Function()? onPressed, void Function()? onBeforeNavigateBack, bool isEdit = false, bool isCheck = false, void Function()? editFunction}) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.close),
      iconSize: 24,
      color: AppColors.white,
      onPressed: () {
        onBeforeNavigateBack?.call();
        Navigator.pop(context);
      },
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: AppColors.primaryOrange,
    actions: [
      if (isEdit)
      IconButton(
        icon: const Icon(Icons.edit),
        iconSize: 24,
        color: AppColors.white,
        onPressed: editFunction,
      ),
      if (isCheck) IconButton(
        icon: const Icon(Icons.check),
        iconSize: 24,
        color: AppColors.white,
        onPressed: onPressed,
      ),
    ],
  );
}
