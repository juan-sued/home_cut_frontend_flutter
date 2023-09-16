import 'package:flutter/material.dart';
import 'package:home_cut/widget/layout/bottom_bar_buttons.dart';
import 'package:home_cut/widget/calendar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {super.key, required this.title, required this.pageController});
  final String title;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(title),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
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
            BottomBarButtons(
              pageController: pageController,
            )
          ],
        ),
      ),
    );
  }
}
