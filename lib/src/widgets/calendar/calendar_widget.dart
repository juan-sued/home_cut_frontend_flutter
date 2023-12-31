import 'package:flutter/material.dart';
import 'package:home_cut/src/models/event_model.dart';
import 'package:home_cut/src/provider/event_provider.dart';
import 'package:home_cut/src/screens/event_details_page.dart';
import 'package:home_cut/src/source/event_data_source.dart';
import 'package:home_cut/src/widgets/calendar/appointment_builder.dart';
import 'package:home_cut/src/widgets/calendar/tasks_widget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
export '../cards_days_widget.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ColorScheme colorTheme = Theme.of(context).colorScheme;

    return FutureBuilder<List<EventModel>>(
      future: Provider.of<EventProvider>(context).getAllEvents(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              margin: EdgeInsets.only(top: 80),
              child: CircularProgressIndicator(
                color: colorTheme.tertiary,
              ));
        } else if (snapshot.hasData) {
          final events = snapshot.data!;
          for (var elemento in events) {
            print(elemento.title);
            print(elemento.from);
          }
          return Expanded(
            child: SfCalendar(
              dataSource: EventDataSource(events),
              selectionDecoration: BoxDecoration(
                color: colorTheme.secondary.withOpacity(0.1),
                border: Border.all(
                  color: colorTheme.secondary,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                shape: BoxShape.rectangle,
              ),
              view: CalendarView.day,
              onLongPress: (details) {
                final provider =
                    Provider.of<EventProvider>(context, listen: false);
                provider.setDate(details.date!);

                showModalBottomSheet(
                  context: context,
                  builder: (context) => const TasksWidget(),
                );
              },
              appointmentBuilder: appointmentBuilder,
              initialSelectedDate: _currentDate,
              cellBorderColor: Colors.transparent,
              cellEndPadding: 5,
              viewHeaderHeight: 0,
              headerHeight: 0,
              todayHighlightColor: colorTheme.tertiary,
              showCurrentTimeIndicator: true,
              timeSlotViewSettings: TimeSlotViewSettings(
                  allDayPanelColor: colorTheme.secondary,
                  timeFormat: 'HH:mm',
                  timeIntervalHeight: 150,
                  timeTextStyle:
                      Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: colorTheme.secondary,
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EventDetailsPage(event: event),
                  ),
                );
              },
            ),
          );
        } else {
          return Text('Nenhum evento encontrado.');
        }
      },
    );
  }
}
