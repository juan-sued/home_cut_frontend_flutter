import 'package:flutter/material.dart';
import 'package:home_cut/src/models/event_model.dart';
import 'package:home_cut/src/services/event_service.dart';

class EventController extends ChangeNotifier {
  final EventService _service;
  final PageController pageController = PageController();

  EventController(this._service);

  Future<List<EventModel>> getUpdateEvents() async {
    return await _service.getEvents();
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
