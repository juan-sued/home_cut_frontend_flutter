import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
export 'cards_days_widget.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _currentDate = DateTime.now();

  void _updateDate() {
    setState(() {
      _currentDate = _currentDate.add(const Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfCalendar(
        view: CalendarView.day,
        selectionDecoration: BoxDecoration(
            border: Border.all(
              // Define uma borda
              color: Theme.of(context).colorScheme.secondary,
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        initialSelectedDate: _currentDate,
        cellBorderColor: Colors.transparent,
        cellEndPadding: 5,
        viewHeaderHeight: 0,
        headerHeight: 0,
        todayHighlightColor: Theme.of(context).colorScheme.tertiary,
        showCurrentTimeIndicator: true,
        timeSlotViewSettings: TimeSlotViewSettings(
            allDayPanelColor: Theme.of(context).colorScheme.secondary,
            timeFormat: 'HH:mm',
            timeIntervalHeight: 150,
            timeTextStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              shadows: [
                Shadow(
                  blurRadius: 3.0, // Define o raio do desfoque da sombra
                  color:
                      Colors.black.withOpacity(0.3), // Define a cor da sombra
                  offset: const Offset(1, 1), // Define o deslocamento da sombra
                ),
              ],
            )),
      ),
    );
  }
}
