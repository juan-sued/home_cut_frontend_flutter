import 'package:flutter/material.dart';
import 'package:home_cut/provider/event_provider.dart';
import 'package:home_cut/provider/page_controller_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

Widget appointmentBuilder(
    BuildContext context, CalendarAppointmentDetails details) {
  final event = details.appointments.first;
  final pageController =
      Provider.of<PageControllerProvider>(context, listen: false)
          .pageController;
  final eventProvider = Provider.of<EventProvider>(context, listen: false);
  return GestureDetector(
    onDoubleTap: () => {
      eventProvider.setSelectedEvent = event,
      Navigator.of(context).popUntil((route) => route.isFirst),
      Future.delayed(
          Duration(milliseconds: 300),
          () => pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ))
    },
    child: Container(
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
    ),
  );
}
