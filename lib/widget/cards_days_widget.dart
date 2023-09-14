import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'calendar_widget.dart';

class CardsDaysWidget extends StatefulWidget {
  const CardsDaysWidget({super.key});

  @override
  State<CardsDaysWidget> createState() => _CardsDaysWidgetState();
}

class _CardsDaysWidgetState extends State<CardsDaysWidget> {
  List<List<String>> listDays = [];

  void _updateDates() {
    setState(() {
      listDays = List.generate(7, (index) {
        final now = DateTime.now().add(Duration(days: index));
        final formattedDay = DateFormat('E', 'pt_BR')
            .format(now)
            .toUpperCase()
            .replaceAll('.', '');
        final formattedNumber = DateFormat('d').format(now);
        return [formattedDay, formattedNumber];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (listDays.isEmpty || DateTime.now().toUtc().hour == 0) _updateDates();

    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          ...listDays
              .map((day) => CardDayWidget(
                    dayOfWeek: day[0],
                    numberDay: day[1],
                  ))
              .toList()
        ],
      ),
    );
  }
}

class CardDayWidget extends StatelessWidget {
  const CardDayWidget(
      {super.key, required this.dayOfWeek, required this.numberDay});
  final String dayOfWeek;
  final String numberDay;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => {},
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.all(11),
          height: 70,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Colors.brown.shade500,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(14)),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  dayOfWeek,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  numberDay,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
