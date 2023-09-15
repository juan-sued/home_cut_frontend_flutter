import 'package:flutter/material.dart';
import 'package:home_cut/widget/layout/bottom_bar_buttons.dart';
import 'package:home_cut/widget/calendar_widget.dart';

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
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Column(
                children: [CardsDaysWidget(), CalendarWidget()],
              ),
            ),
            const BottomBarButtons()
          ],
        ),
      ),
    );
  }
}
