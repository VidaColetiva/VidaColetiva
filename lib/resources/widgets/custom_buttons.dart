import 'package:flutter/material.dart';
import '../assets/colour_pallete.dart';

Widget addButton(
    BuildContext context, void Function() onPressed, String text, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        fixedSize: const Size(double.infinity,
            60),
        backgroundColor: AppColors.secondaryOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.add, color: AppColors.white, size: 32),
            ),
            Text(text,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.white,
            )
          ],
        ),
      ),
    ),
  );
}
