import 'package:flutter/material.dart';
import 'package:vidacoletiva/data/models/event_model.dart';
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
}