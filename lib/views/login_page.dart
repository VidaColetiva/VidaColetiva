import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/user_controller.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  "lib/resources/assets/images/logo.png",
                  color: AppColors.primaryOrange,
                  width: 150,
                ),
                const SizedBox(height: 20,),
                const Text(
                  "VIDA",
                  style: TextStyle(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Text(
                  "COLETIVA",
                  style: TextStyle(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            googleLoginWidget(context),
          ],
        ),
      ),
    );
  }

  ElevatedButton googleLoginWidget(BuildContext context) {
    return ElevatedButton(
        onPressed: Provider.of<UserController>(context).loginGoogle,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryGreen,
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Entrar com Google",
            style: TextStyle(color: AppColors.white, fontSize: 20),
          ),
        ));
  }
}
