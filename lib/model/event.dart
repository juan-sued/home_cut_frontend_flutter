import 'package:flutter/material.dart';

class Event {
  final String id;
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;
  final String idClient;
  //idClient
  //idEvent

  const Event(
      {required this.id,
      required this.title,
      required this.description,
      required this.from,
      required this.to,
      this.backgroundColor = const Color.fromARGB(255, 52, 87, 70),
      this.isAllDay = false,
      required this.idClient});
}
