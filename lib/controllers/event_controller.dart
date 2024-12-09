import 'package:flutter/material.dart';
import 'package:vidacoletiva/data/models/event_model.dart';
import 'package:vidacoletiva/data/models/media_model.dart';
import 'package:vidacoletiva/data/services/event_service.dart';

class EventController extends ChangeNotifier {
  EventService eventService;

  EventController(this.eventService);

  List<EventModel> events = [];

  init() async {
    await listOwnEvents();
  }

  Future listOwnEvents() async {
    events = await eventService.listOwn();
    debugPrint('events: ${events.length}');
    notifyListeners();
  }

  List<EventModel> getEventsOnProject(String projectId) {
    var e = events.where((ev) => ev.projectId == projectId).toList();
    return e;
  }

  Future createEvent(String title, String description, String projectId, List<CreateMedia> mediaList) async {
    EventModel e = await eventService.addEvent(
        EventModel(
          title: title,
          text: description,
          projectId: projectId,
        ),
        mediaList);
    events.add(e);
    notifyListeners();
    // await listOwnEvents();
  }
}
