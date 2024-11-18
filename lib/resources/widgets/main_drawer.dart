import 'package:flutter/material.dart';

import '../assets/colour_pallete.dart';

Widget mainDrawer(BuildContext context){
  return Drawer(
    width: MediaQuery.of(context).size.width/1.5,
    backgroundColor: AppColors.tertiaryOrange,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: AppColors.primaryOrange,
          ),
          child: Text(
            'Olá, Fulano!',
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height/25,
              fontWeight: FontWeight.bold
            )
          ),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        ListTile(
          title: Text('Eventos'),
          onTap: () {
            Navigator.pushNamed(context, '/events');
          },
        ),
        ListTile(
          title: Text('Projetos'),
          onTap: () {
            Navigator.pushNamed(context, '/project');
          },
        ),
        ListTile(
          title: Text('Eventos V2'),
          onTap: () {
            Navigator.pushNamed(context, '/events_v2');
          },
        ),
        ListTile(
          title: Text('Adicionar Evento'),
          onTap: () {
            Navigator.pushNamed(context, '/add_event');
          },
        ),
      ],
    ),
  );
}