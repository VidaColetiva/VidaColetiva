import 'package:flutter/material.dart';
import 'package:vidacoletiva/data/models/event_model.dart';
import 'package:vidacoletiva/data/models/media_model.dart';
import 'package:vidacoletiva/data/services/event_service.dart';

class EventController extends ChangeNotifier {
  EventService eventService;

  EventController(this.eventService);

  List<EventModel> events = [];
  Map<String,List<EventModel>> eventsInProject = {};

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  init() async {
    await listOwnEvents();
  }

  Future listOwnEvents() async {
    events = await eventService.listOwn();
    debugPrint('events: ${events.length}');
    notifyListeners();
  }

  Future listEventsOnProject(String projectId) async {
    List<EventModel> m = await eventService.listEventsOnProject(projectId);
    eventsInProject[projectId] = m;
    notifyListeners();
  }

  List<EventModel> getEventsOnProject(String projectId) {
    var e = events.where((ev) => ev.projectId == projectId).toList();
    return e;
  }
  
  List<EventModel> getAllEventsOnProject(String? projectId) {
    if (projectId == null) {
      return [];
    }
    return eventsInProject[projectId] ?? [];
  }

  Future<bool> createEvent(String? title, String? description, String projectId, List<CreateMedia> mediaList) async {
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return false;
    }
    EventModel e = await eventService.addEvent(
        EventModel(
          title: title,
          text: description,
          projectId: projectId,
        ),
        mediaList);
    events.add(e);
    notifyListeners();
    return true;
    // await listOwnEvents();
  }
}
