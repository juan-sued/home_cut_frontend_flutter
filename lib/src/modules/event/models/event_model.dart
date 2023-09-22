import 'package:flutter/material.dart';

class EventModel {
  final String id;
  final String title;
  final String? description; // Agora é opcional
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;
  final String idClient;

  const EventModel({
    required this.id,
    required this.title,
    this.description, // Agora é opcional
    required this.from,
    required this.to,
    this.backgroundColor = const Color.fromARGB(255, 52, 87, 70),
    this.isAllDay = false,
    required this.idClient,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'][r'''$oid'''],
      title: json['title'],
      description: json['description'],
      from: DateTime.parse(json['from']),
      to: DateTime.parse(json['to']),
      isAllDay: json['isAllDay'],
      backgroundColor:
          Color(int.parse(json['backgroundColor'].substring(1), radix: 16)),
      idClient: json['idClient'][r'''$oid'''],
    );
  }
  static EventModel stub({
    String id = '650ca9b9b69101883bf06dd2',
    String title = 'Goldi',
    String description = 'Curabitur in libero ut massa volutpat convallis...',
    String from = '2023-08-21T13:18:22Z',
    String to = '2023-02-13T00:25:47Z',
    bool isAllDay = true,
    String backgroundColor = '#8c4ed2',
    String idClient = '650ca9b9b69101883bf06dd3',
  }) {
    Color hexToColor(String hexColor) {
      return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return EventModel(
      id: id,
      title: title,
      description: description,
      from: DateTime.parse(from),
      to: DateTime.parse(to),
      isAllDay: isAllDay,
      backgroundColor: hexToColor(backgroundColor),
      idClient: idClient,
    );
  }
}
