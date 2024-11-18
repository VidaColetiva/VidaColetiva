import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/widgets/main_drawer.dart';
import '../assets/colour_pallete.dart';

AppBar mainAppBar(BuildContext mainContext, {bool? leading, GlobalKey<ScaffoldState>? scaffoldKey}){
  return AppBar(
    leading: leading == true ? IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        iconSize: MediaQuery.of(mainContext).size.height/25,
        color: AppColors.white,
        onPressed: (){Navigator.pop(mainContext);},
    ) : null,
    toolbarHeight: MediaQuery.of(mainContext).size.height/9,
    title: [null, false].contains(leading) ?
    Image.asset(
      'lib/resources/assets/images/vida-coletiva-logo.png',
      height: MediaQuery.of(mainContext).size.height/15
    )
    : null,
    backgroundColor: AppColors.primaryOrange,
    actions: [
      IconButton(
        icon: const Icon(Icons.notifications_none_outlined),
        iconSize: MediaQuery.of(mainContext).size.height/25,
        color: AppColors.white,
        onPressed: (){},
      ),
      IconButton(
        icon: const Icon(Icons.account_circle_outlined),
        iconSize: MediaQuery.of(mainContext).size.height/25,
        color: AppColors.white,
        onPressed: (){
          scaffoldKey?.currentState?.openDrawer();
        },
      ),
    ],
  );
}