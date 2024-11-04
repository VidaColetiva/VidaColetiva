
import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';

BottomNavigationBar mainBottomBar(BuildContext context, int selectedIndex, Function(int) onItemTapped){
  Widget circularIcon(IconData icon){
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryGreen,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: selectedIndex == 1
            ? Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: Icon(Icons.add, color: Colors.white),
        )
            : Icon(Icons.add),
        label: 'Add',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
    currentIndex: selectedIndex,
    onTap: (int index){
      onItemTapped(index);
    },
  );
}