import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/user_controller.dart';
import 'package:vidacoletiva/views/home_page.dart';
import 'package:vidacoletiva/views/loading_page.dart';
import 'package:vidacoletiva/views/login_page.dart';

class RedirectionPage extends StatelessWidget {
  const RedirectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Provider.of<UserController>(context);
    if (userController.isLoading) {
      return const LoadingPage();
    }
    if (userController.isLogged) {
      return const HomePage();
    }
    else {
      return const LoginPage();
    }
  }
}