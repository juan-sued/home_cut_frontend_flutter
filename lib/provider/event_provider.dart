import 'package:flutter/material.dart';
import 'package:home_cut/model/event.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => _events;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Event> get eventsOfSelectedDate => _events;

  Event? _selectedEvent;

  Event? get selectedEvent => _selectedEvent;

  set setSelectedEvent(Event? event) {
    _selectedEvent = event;
    notifyListeners();
  }

  void addEvent(Event event) {
    _events.add(event);

    notifyListeners();
  }

  void editEvent(Event newEvent) {
    final index = _events.indexWhere((event) => event.id == newEvent.id);

    _events[index] = newEvent;

    notifyListeners();
  }
}
