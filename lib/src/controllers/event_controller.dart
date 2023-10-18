import 'package:flutter/material.dart';
import 'package:home_cut/src/models/event_model.dart';
import 'package:home_cut/src/services/event_service.dart';

class EventController extends ChangeNotifier {
  final EventService _service;
  final PageController pageController = PageController();

  EventController(this._service);

  var events = <EventModel>[];

  Future<void> getUpdateEvents() async {
    events = await _service.getEvents();

    notifyListeners();
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
