import 'package:flutter/material.dart';
import 'package:home_cut/src/controllers/event_controller.dart';
import 'package:home_cut/src/models/event_model.dart';
import 'package:home_cut/src/services/event_service.dart';
import 'package:home_cut/src/services/uno_client.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class EventProvider extends ChangeNotifier {
  final List<EventModel> _events = <EventModel>[];

  List<EventModel> get events => _events;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<EventModel> get eventsOfSelectedDate => _events;

  EventModel? _selectedEvent;

  EventModel? get selectedEvent => _selectedEvent;

  set setSelectedEvent(EventModel? event) {
    _selectedEvent = event;
    notifyListeners();
  }

  Future<List<EventModel>> getAllEvents() async {
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return events;
    } else {
      final controller = EventController(EventService(UnoClient()));
      await controller.getUpdateEvents();
      notifyListeners();
    }

    return events;
  }

  void addEvent(EventModel event) {
    _events.add(event);

    //TODO
    // Enviar requisição para o backend para salvar o novo evento
    // Aguardar resposta do backend com o ID gerado para o novo evento

    notifyListeners();
  }

  void editEvent(EventModel newEvent) {
    final index = _events.indexWhere((event) => event.id == newEvent.id);

    print(_events);

    _events[index] = newEvent;
    //TODO
    // Enviar requisição para o backend para atualizar o evento
    // Aguardar resposta do backend confirmando a atualização
    notifyListeners();
  }

  void deleteEvent(EventModel event) {
    _events.remove(event);
    //TODO
    // Enviar requisição para o backend indicando o evento a ser excluído
    // Aguardar resposta do backend confirmando a exclusão
    notifyListeners();
  }
}
