import 'package:flutter/material.dart';
import 'package:home_cut/page/event_details_page.dart';
import 'package:home_cut/source/event_data_source.dart';
import 'package:home_cut/provider/event_provider.dart';
import 'package:home_cut/widget/service/appointment_builder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context, listen: false);
    ThemeData theme = Theme.of(context);
    final selectedEvents = provider.eventsOfSelectedDate;

    if (selectedEvents.isEmpty) {
      return const Center(
          child: Text(
        'Sem eventos!',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ));
    }

    return SfCalendarTheme(
        data: SfCalendarThemeData(
          headerBackgroundColor: const Color.fromARGB(255, 23, 51, 38),
          timeTextStyle:
              TextStyle(color: theme.colorScheme.secondary, fontSize: 12),
          cellBorderColor: Colors.transparent,
          headerTextStyle: TextStyle(
              color: theme.colorScheme.primary,
              decoration: TextDecoration.underline),
          viewHeaderBackgroundColor: const Color.fromARGB(255, 23, 51, 38),
          todayHighlightColor: theme.colorScheme.tertiary,
        ),
        child: SfCalendar(
          headerHeight: 0,
          selectionDecoration: BoxDecoration(
            color: theme.colorScheme.secondary.withOpacity(0.1),
            border: Border.all(
              color: theme.colorScheme.secondary,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            shape: BoxShape.rectangle,
          ),
          viewHeaderHeight: 40,
          viewHeaderStyle: ViewHeaderStyle(
            dateTextStyle: theme.textTheme.labelSmall,
            dayTextStyle: theme.textTheme.labelSmall,
          ),
          timeSlotViewSettings: const TimeSlotViewSettings(
            timeInterval: Duration(minutes: 30),
            // startHour: 8,
            // endHour: 18,
            minimumAppointmentDuration: Duration(minutes: 0),
            timeFormat: 'H:mm',
          ),
          view: CalendarView.timelineWeek,
          dataSource: EventDataSource(provider.events),
          initialDisplayDate: provider.selectedDate,
          appointmentBuilder: appointmentBuilder,
          onTap: (details) {
            if (details.appointments == null) return;

            final event = details.appointments!.first;

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventDetailsPage(event: event)));

            //pagina de detalhes
          },
        ));
  }
}
