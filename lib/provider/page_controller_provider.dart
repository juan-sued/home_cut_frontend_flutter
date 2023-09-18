import 'package:flutter/material.dart';

class PageControllerProvider extends ChangeNotifier {
  final PageController pageController = PageController();

  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
