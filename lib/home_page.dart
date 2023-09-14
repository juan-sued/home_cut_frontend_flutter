import 'package:flutter/material.dart';
import 'package:home_cut/widget/calendar_widget.dart';
import 'package:home_cut/widget/cards_days_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(4),
          child: const Column(
            children: [CardsDaysWidget(), CalendarWidget()],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Atualiza os segundos',
        child: const Icon(Icons.add),
      ),
    );
  }
}
