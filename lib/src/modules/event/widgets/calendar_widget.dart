import 'package:flutter/material.dart';

import 'package:home_cut/src/modules/event/controllers/event_controller.dart';
import 'package:home_cut/src/modules/event/services/event_service.dart';
import 'package:home_cut/src/modules/event/services/uno_client.dart';
import 'package:home_cut/src/modules/event/views/event_details_page.dart';
import 'package:home_cut/src/modules/event/source/event_data_source.dart';
import 'package:home_cut/provider/event_provider.dart';
import 'package:home_cut/src/modules/event/widgets/appointment_builder.dart';
import 'package:home_cut/src/modules/event/widgets/tasks_widget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
export '../../../../widget/cards_days_widget.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _currentDate = DateTime.now();

  final controller = EventController(EventService(UnoClient()));

  @override
  void initState() {
    super.initState();
    controller.getAllEvents();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final events = controller.events;

    return Expanded(
      child: SfCalendar(
        selectionDecoration: BoxDecoration(
          color: theme.colorScheme.secondary.withOpacity(0.1),
          border: Border.all(
            color: theme.colorScheme.secondary,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          shape: BoxShape.rectangle,
        ),
        view: CalendarView.day,
        onLongPress: (details) {
          final provider = Provider.of<EventProvider>(context, listen: false);
          provider.setDate(details.date!);

          showModalBottomSheet(
              context: context, builder: (context) => const TasksWidget());
        },
        appointmentBuilder: appointmentBuilder,
        dataSource: EventDataSource(events),
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
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(1, 1),
                ),
              ],
            )),
        onTap: (details) {
          if (details.appointments == null) return;

          final event = details.appointments!.first;

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EventDetailsPage(event: event)));

          //pagina de detalhes
        },
      ),
    );
  }
}
