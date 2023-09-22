import 'package:flutter/material.dart';
import 'package:home_cut/widget/layout/bottom_bar_buttons.dart';
import 'package:home_cut/widget/calendar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        elevation: 0,
        title: Text('HomeCut'),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
              child: const Column(
                children: [CardsDaysWidget(), CalendarWidget()],
              ),
            ),
            BottomBarButtons()
          ],
        ),
      ),
    );
  }
}
