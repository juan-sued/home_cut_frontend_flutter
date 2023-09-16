import 'package:flutter/material.dart';
import 'package:home_cut/page/event_editing_page.dart';
import 'package:home_cut/page/home_page.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        HomePage(
          title: 'Home Cut',
          pageController: pageController,
        ),
        EventEditingPage(
          pageController: pageController,
        )
      ],
    );
  }
}
