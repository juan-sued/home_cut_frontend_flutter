import 'package:flutter/material.dart';

Future<DateTime?> pickDateTime(
  BuildContext context,
  DateTime initialDate, {
  required bool pickDate,
  DateTime? firstDate,
}) async {
  if (pickDate) {
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 100)),
    );

    if (date == null) return null;

    final time = Duration(hours: initialDate.hour, minutes: initialDate.minute);

    return date.add(time);
  } else {
    final timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate),
    );

    if (timeOfDay == null) return null;

    final date = DateTime(
      initialDate.year,
      initialDate.month,
      initialDate.day,
    );

    final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

    return date.add(time);
  }
}
