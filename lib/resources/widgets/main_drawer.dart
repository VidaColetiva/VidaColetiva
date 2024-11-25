import 'package:flutter/material.dart';

import '../assets/colour_pallete.dart';

Widget mainDrawer(BuildContext context){
  Widget textButton(String text, Function onPressed){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20, vertical: MediaQuery.of(context).size.height/60),
      child: TextButton(
        onPressed: (){
          onPressed();
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/60),
          backgroundColor: AppColors.primaryOrange,
        ),
        child: Text(
            text,
            style: TextStyle(
                color: AppColors.white,
                fontSize: MediaQuery.of(context).size.height/40,
                fontWeight: FontWeight.bold
            )
        ),
      ),
    );
  }

  return Drawer(
    width: MediaQuery.of(context).size.width/1.5,
    backgroundColor: AppColors.tertiaryOrange,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
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
              Icon(Icons.account_circle_outlined, size: MediaQuery.of(context).size.height/12, color: AppColors.primaryOrange),
              Text(
                'Olá, Fulano!',
                style: TextStyle(
                  color: AppColors.darkGreen,
                  fontSize: MediaQuery.of(context).size.height/30,
                  fontWeight: FontWeight.bold
                )
              ),
            ],
          ),
        ),
        textButton('Perfil', (){Navigator.pushNamed(context, '/profile');}),
        textButton('Preferências', (){}),
        textButton('Sobre o app', (){}),
        textButton('Termos legais', (){}),
        textButton('Avaliar app', (){}),
        textButton('Sair', (){}),
      ],
    ),
  );
}