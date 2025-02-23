import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/event_controller.dart';
import 'package:vidacoletiva/controllers/project_controller.dart';
import 'package:vidacoletiva/data/models/event_model.dart';
import 'package:vidacoletiva/resources/widgets/main_app_bar.dart';
import 'package:vidacoletiva/views/events/event_card.dart';

class AllEventsOnProjectPage extends StatelessWidget {
  const AllEventsOnProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    EventController eventController = Provider.of(context);
    ProjectController projectController = Provider.of(context);
    String projectId = projectController.project!.id!;
    return Scaffold(
        appBar: mainAppBar(context),
        body: SingleChildScrollView(
            child:
                eventList(eventController.getAllEventsOnProject(projectId))));
  }

  Widget eventList(List<EventModel> events) {
    return Column(
      children: events
          .map((e) => EventCard(
                event: e,
              ))
          .toList(),
    );
  }
}
