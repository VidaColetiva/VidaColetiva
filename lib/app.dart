import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/user_controller.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';
import 'package:vidacoletiva/views/redirection_page.dart';

class VidaColetiva extends StatelessWidget {
  const VidaColetiva({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserController>(
              create: (_) => UserController(GetIt.I.get())..init()),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Vida Coletiva',
            theme: ThemeData(
              primaryColor: AppColors.primaryOrange,
            ),
            home: const RedirectionPage(),
          );
        });
  }
}
