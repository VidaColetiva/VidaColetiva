import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/event_controller.dart';
import 'package:vidacoletiva/resources/widgets/main_app_bar.dart';
import 'package:vidacoletiva/resources/widgets/main_drawer.dart';
import 'package:vidacoletiva/views/events/event_card.dart';

import '../resources/widgets/main_bottom_bar.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: scaffoldKey,
      appBar: mainAppBar(context, scaffoldKey: scaffoldKey),
      bottomNavigationBar: mainBottomBar(context, 0, bottomBarNav),
      endDrawer: mainDrawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Meus eventos", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                ),
                ...eventController.events.map((e) => EventCard(event: e))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
