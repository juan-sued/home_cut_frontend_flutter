import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<String>> listDays = [];

  void _updateDates() {
    setState(() {
      listDays = List.generate(7, (index) {
        final now = DateTime.now().add(Duration(days: index));
        final formattedDay = DateFormat('E', 'pt_BR').format(now).toUpperCase();
        final formattedNumber = DateFormat('s').format(now);
        return [formattedDay, formattedNumber];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (listDays.isEmpty || DateTime.now().toUtc().hour == 0) _updateDates();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    for (int i = 0; i < listDays.length; i++)
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          padding: const EdgeInsets.all(11),
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.brown.shade500,
                            gradient: LinearGradient(
                              colors: [
                                Colors.brown.shade600,
                                Colors.brown.shade300
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14)),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  listDays[i][0],
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  listDays[i][1],
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _updateDates(),
        tooltip: 'Atualiza os segundos',
        child: const Icon(Icons.add),
      ),
    );
  }
}
