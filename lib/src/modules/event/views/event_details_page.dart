import 'package:flutter/material.dart';
import 'package:home_cut/provider/event_provider.dart';
import 'package:home_cut/provider/page_controller_provider.dart';
import 'package:home_cut/src/modules/event/models/event_model.dart';
import 'package:home_cut/utils.dart';
import 'package:home_cut/src/modules/event/widgets/basic_app_bar.dart';
import 'package:provider/provider.dart';

class EventDetailsPage extends StatelessWidget {
  final EventModel event;

  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, Navigator.of(context).pop, event.title,
          buildDetailsAction(context, event)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildDateTime(event),
            SizedBox(
              height: 24,
            ),
            Text(
              event.description ?? 'Sem descrição',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDateTime(EventModel event) => Column(
        children: [
          buildDate(
              event.isAllDay ? 'All-day' : 'Início do evento', event.from),
          if (!event.isAllDay) buildDate('Fim do evento', event.to),
        ],
      );

  Widget buildDate(String title, DateTime date) => ListTile(
        title: Text(title),
        subtitle: Text(
          Utils.toDateTime(date),
          style: TextStyle(fontSize: 18),
        ),
      );

  List<Widget> buildDetailsAction(BuildContext context, EventModel event) {
    final pageController =
        Provider.of<PageControllerProvider>(context, listen: false)
            .pageController;
    final eventProvider = Provider.of<EventProvider>(context, listen: false);

    return [
      IconButton(
        onPressed: () => {
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
        icon: Icon(Icons.edit),
      ),
      IconButton(
        onPressed: () => {
          eventProvider.deleteEvent(event),
          Navigator.of(context).popUntil((route) => route.isFirst),
        },
        icon: Icon(Icons.delete_forever_rounded),
      )
    ];
  }
}
