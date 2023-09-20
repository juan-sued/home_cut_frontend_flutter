import 'package:flutter/material.dart';

class NewEvent {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;

  const NewEvent({
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    this.backgroundColor = const Color.fromARGB(255, 52, 87, 70),
    this.isAllDay = false,
  });
}
