import 'package:flutter/material.dart';
import '../assets/colour_pallete.dart';

SliverAppBar mainSliverAppBar(BuildContext mainContext,
    {bool? leading, bool profile = true, GlobalKey<ScaffoldState>? scaffoldKey}) {
  return SliverAppBar(
    leading: leading == true
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 24,
            color: AppColors.white,
            onPressed: () {
              Navigator.pop(mainContext);
            },
          )
        : null,
    // toolbarHeight: 100,
    title: [null, false].contains(leading)
        ? Image.asset('lib/resources/assets/images/vida-coletiva-logo.png',
            height: 32)
        : null,
    backgroundColor: AppColors.primaryOrange,
    actions: [
      // IconButton(
      //   icon: const Icon(Icons.notifications_none_outlined),
      //   iconSize: MediaQuery.of(mainContext).size.height / 25,
      //   color: AppColors.white,
      //   onPressed: () {},
      // ),
      if (profile) IconButton(
        icon: const Icon(Icons.account_circle_outlined),
        iconSize: 32,
        color: AppColors.white,
        onPressed: () {
          scaffoldKey?.currentState?.openEndDrawer();
        },
      ),
    ],
  );
}
