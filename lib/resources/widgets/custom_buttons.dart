import 'package:flutter/material.dart';
import '../assets/colour_pallete.dart';

Widget addButton(BuildContext context, Function onPressed, String text, Color color){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 5,
      fixedSize: Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height/13),
      backgroundColor: AppColors.white,
      side: BorderSide(
        color: color,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: (){
      onPressed();
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width/12,
          height: MediaQuery.of(context).size.width/12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.add, color: AppColors.white, size: MediaQuery.of(context).size.width/12),
        ),
        Text(
            text,
            style: TextStyle(
              color: AppColors.darkGreen,
              fontSize: MediaQuery.of(context).size.height/40,
              fontWeight: FontWeight.bold,
            )
        ),
        Icon(Icons.arrow_forward_ios_rounded, color: color,)
      ],
    ),
  );
}