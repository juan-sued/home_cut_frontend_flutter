import 'package:flutter/material.dart';

class PageControllerProvider extends ChangeNotifier {
  final PageController pageController = PageController();

  PageControllerProvider() {
    pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    notifyListeners();
  }

  void dispose() {
    pageController.removeListener(_onPageChanged);
    pageController.dispose();
    super.dispose();
  }
}
