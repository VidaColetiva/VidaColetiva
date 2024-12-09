import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/event_controller.dart';
import 'package:vidacoletiva/controllers/project_controller.dart';
import 'package:vidacoletiva/controllers/user_controller.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';
import 'package:vidacoletiva/views/add_event_page.dart';
import 'package:vidacoletiva/views/add_project_page.dart';
import 'package:vidacoletiva/views/events_page.dart';
import 'package:vidacoletiva/views/home_page.dart';
import 'package:vidacoletiva/views/my_contributions_page.dart';
import 'package:vidacoletiva/views/profile_data.dart';
import 'package:vidacoletiva/views/profile_page.dart';
import 'package:vidacoletiva/views/project_page.dart';
import 'package:vidacoletiva/views/redirection_page.dart';

class VidaColetiva extends StatelessWidget {
  const VidaColetiva({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserController>(
              create: (_) => UserController(GetIt.I.get())..init()),
          ChangeNotifierProvider<EventController>(
              create: (_) => EventController(GetIt.I.get())..init()),
          ChangeNotifierProvider<ProjectController>(
              create: (_) => ProjectController(GetIt.I.get())..init()),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Vida Coletiva',
            theme: ThemeData(
              primaryColor: AppColors.primaryOrange,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const RedirectionPage(),
              '/home': (context) => const HomePage(),
              '/events': (context) => const EventsPage(),
              '/project': (context) => const ProjectPage(),
              '/my_contributions': (context) => const MyContributionsPage(),
              '/add_project': (context) => const AddProjectPage(),
              '/add_event': (context) => const AddEventPage(),
              '/profile': (context) => const ProfilePage(),
              '/profile_data': (context) => const ProfileData(),
            },
            // home: const RedirectionPage(),
          );
        });
  }
}
