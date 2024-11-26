import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/event_controller.dart';
import 'package:vidacoletiva/resources/widgets/main_app_bar.dart';
import 'package:vidacoletiva/views/events/event_card.dart';

import '../resources/widgets/main_bottom_bar.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  void bottomBarNav(int where) {
    switch (where) {
      case 0:
        break;
      case 1:
        Navigator.popAndPushNamed(context, '/home');
        break;
      case 2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventController = Provider.of<EventController>(context);

    return Scaffold(
      appBar: mainAppBar(context),
      bottomNavigationBar: mainBottomBar(context, 0, bottomBarNav),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...eventController.events.map((e) => EventCard(event: e))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
