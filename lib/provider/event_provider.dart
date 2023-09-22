import 'package:flutter/material.dart';
import 'package:home_cut/src/modules/event/models/event_model.dart';

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

  void addEvent(EventModel event) {
    _events.add(event);

    //TODO
    // Enviar requisição para o backend para salvar o novo evento
    // Aguardar resposta do backend com o ID gerado para o novo evento

    notifyListeners();
  }

  void editEvent(EventModel newEvent) {
    final index = _events.indexWhere((event) => event.id == newEvent.id);
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
