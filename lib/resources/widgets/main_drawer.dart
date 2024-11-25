import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/user_controller.dart';

import '../assets/colour_pallete.dart';

Widget textButton(String text, BuildContext context, Function onPressed) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 20,
        vertical: MediaQuery.of(context).size.height / 60),
    child: TextButton(
      onPressed: () {
        onPressed();
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 60),
        backgroundColor: AppColors.primaryOrange,
      ),
      child: Text(text,
          style: TextStyle(
              color: AppColors.white,
              fontSize: MediaQuery.of(context).size.height / 40,
              fontWeight: FontWeight.bold)),
    ),
  );
}

Widget mainDrawer(BuildContext context) {
  UserController userController = Provider.of<UserController>(context);

  return Drawer(
    width: MediaQuery.of(context).size.width / 1.5,
    backgroundColor: AppColors.tertiaryOrange,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: AppColors.tertiaryOrange,
            border: Border(
              bottom: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.account_circle_outlined,
                  size: MediaQuery.of(context).size.height / 12,
                  color: AppColors.primaryOrange),
              Text('Olá!',
                  style: TextStyle(
                      color: AppColors.darkGreen,
                      fontSize: MediaQuery.of(context).size.height / 30,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        textButton('Perfil', context, () {}),
        textButton('Preferências', context, () {}),
        textButton('Sobre o app', context, () {}),
        textButton('Termos legais', context, () {}),
        textButton('Avaliar app', context, () {}),
        textButton('Sair', context, () async {
          userController.logout();
        }),
      ],
    ),
  );
}
