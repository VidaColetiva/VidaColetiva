import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/user_controller.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "lib/resources/assets/images/logo.png",
          color: AppColors.primaryOrange,
        ),
        const Text("Vida Coletiva"),
        googleLoginWidget(context),
      ],
    );
  }

  ElevatedButton googleLoginWidget(BuildContext context) {
    return ElevatedButton(
        onPressed: Provider.of<UserController>(context).loginGoogle,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryGreen,
        ),
        child: const Text(
          "Entrar com Google",
          style: TextStyle(color: AppColors.white),
        ));
  }
}
