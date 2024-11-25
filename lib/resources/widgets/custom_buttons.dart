import 'package:flutter/material.dart';
import '../assets/colour_pallete.dart';

Widget addButton(
    BuildContext context, void Function() onPressed, String text, Color color) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 5,
      fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
          MediaQuery.of(context).size.height / 13),
      backgroundColor: AppColors.white,
      side: BorderSide(
        color: color,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: onPressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.add, color: AppColors.white, size: 32),
        ),
        Text(text,
            style: TextStyle(
              color: AppColors.darkGreen,
              fontSize: MediaQuery.of(context).size.height / 40,
              fontWeight: FontWeight.bold,
            )),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: color,
        )
      ],
    ),
  );
}
