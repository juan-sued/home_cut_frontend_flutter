import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

Widget appointmentBuilder(
    BuildContext context, CalendarAppointmentDetails details) {
  final event = details.appointments.first;
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: event.backgroundColor.withOpacity(0.5),
      borderRadius: BorderRadius.circular(12),
    ),
    width: details.bounds.width,
    height: details.bounds.height,
    child: Text(event.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 13,
        )),
  );
}
