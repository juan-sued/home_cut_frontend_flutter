import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...listDays
              .map((day) => CardDayWidget(
                    dayOfWeek: day[0],
                    numberDay: day[1],
                    // ignore: avoid_print
                    onPressed: () => {print('tocou no dia: ${day[1]}')},
                  ))
              .toList()
        ],
      ),
    );
  }
}

class CardDayWidget extends StatelessWidget {
  const CardDayWidget({
    super.key,
    required this.dayOfWeek,
    required this.numberDay,
    required this.onPressed,
  });

  final String dayOfWeek;
  final String numberDay;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.all(4),
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.secondary,
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
                Text(dayOfWeek, style: theme.textTheme.labelSmall),
                Text(numberDay, style: theme.textTheme.labelMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
