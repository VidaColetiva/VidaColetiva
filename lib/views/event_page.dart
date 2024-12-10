import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/project_controller.dart';
import 'package:vidacoletiva/data/models/event_model.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';

class EventPage extends StatelessWidget {
  final EventModel event;

  const EventPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final ProjectController projectController =
        Provider.of<ProjectController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(event.title ?? ""),
        backgroundColor: AppColors.primaryOrange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: MediaQuery.of(context).size.height / 25,
          color: AppColors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(event.title ?? "", style: const TextStyle(fontSize: 24),),
            Text(event.description ?? ""),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...photoList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Iterable<Widget> photoList() {
    return event.mediaModelList!.map((media) {
      return FutureBuilder<String>(
        future: media.getUrl(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Image.network(snapshot.data.toString(), fit: BoxFit.fitWidth,);
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    });
  }
}
