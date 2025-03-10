import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/event_controller.dart';
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
                const SizedBox(
                  height: 20,
                ),
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
            versionWidget(),
          ],
        ),
      ),
    );
  }

  ElevatedButton googleLoginWidget(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          if (!context.mounted) {
            return;
          }
          UserController u =Provider.of<UserController>(context, listen: false);
          EventController e = Provider.of<EventController>(context, listen: false);
          await u.loginGoogle();
          e.listOwnEvents();
        },
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

  Widget versionWidget() {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox();
        }
        return Text(snapshot.data!.version);
      }
    );
  }
}
