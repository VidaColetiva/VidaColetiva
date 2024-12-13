import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/event_controller.dart';
import 'package:vidacoletiva/controllers/project_controller.dart';
import 'package:vidacoletiva/views/events/event_card.dart';
import '../resources/assets/colour_pallete.dart';
import '../resources/widgets/main_app_bar.dart';

class MyContributionsPage extends StatefulWidget {
  const MyContributionsPage({super.key});

  @override
  State<MyContributionsPage> createState() => _MyContributionsPageState();
}

class _MyContributionsPageState extends State<MyContributionsPage> {
  @override
  Widget build(BuildContext context) {
    EventController eventController = Provider.of<EventController>(context);
    ProjectController projectController =
        Provider.of<ProjectController>(context);

    return Scaffold(
      appBar: mainAppBar(context, leading: true),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Minhas contribuições',
                        style: TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: MediaQuery.of(context).size.height / 30,
                          fontWeight: FontWeight.bold,
                        )),
                    ...eventController
                        .getEventsOnProject(
                            projectController.project!.id ?? "0")
                        .map((e) => EventCard(event: e))
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.7,
                        MediaQuery.of(context).size.height / 15),
                    backgroundColor: AppColors.darkGreen,
                    side: const BorderSide(
                      color: AppColors.darkGreen,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_event');
                  },
                  child: Text('Contribuir',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: MediaQuery.of(context).size.height / 35,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
