import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/widgets/add_app_bar.dart';

import '../resources/assets/colour_pallete.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addAppBar(context, 'Perfil'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 30),
                child: Text(
                  'Fulano da Silva',
                  style: TextStyle(
                      color: AppColors.darkGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height / 30),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.primaryGreen, width: 2),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(Icons.person_outline_rounded,
                    color: AppColors.primaryGreen,
                    size: MediaQuery.of(context).size.height / 5)),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 30),
              child: Text(
                'ALTERAR FOTO DE PERFIL',
                style: TextStyle(
                    color: AppColors.darkGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height / 50),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20,
                  vertical: MediaQuery.of(context).size.height / 60),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile_data');
                },
                style: TextButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width / 1.5,
                      MediaQuery.of(context).size.height / 15),
                  backgroundColor: AppColors.primaryOrange,
                ),
                child: Text('Meus dados',
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: MediaQuery.of(context).size.height / 40,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
