import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';
import 'package:vidacoletiva/views/events_page.dart';
import 'package:vidacoletiva/views/events_page_v2.dart';
import 'package:vidacoletiva/views/home_page.dart';
import 'package:vidacoletiva/views/project_page.dart';

void main() {
  runApp(const VidaColetiva());
}

class VidaColetiva extends StatelessWidget {
  const VidaColetiva({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vida Coletiva',
      theme: ThemeData(
        primaryColor: AppColors.primaryOrange,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/events': (context) => const EventsPage(),
        '/project': (context) => const ProjectPage(),
        '/events_v2': (context) => const EventsPageV2(),
      },
    );
  }
}
