import 'package:flutter/material.dart';
import 'package:home_cut/src/screens/event_editing_page.dart';
import 'package:home_cut/src/screens/home_page.dart';
import 'package:home_cut/src/provider/page_controller_provider.dart';
import 'package:provider/provider.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController =
        Provider.of<PageControllerProvider>(context, listen: false)
            .pageController;

    pageController.addListener(() {
      // Aqui, quando a página mudar, você pode ocultar o SnackBar.
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });

    return PageView(
      controller: pageController,
      children: [HomePage(), EventEditingPage()],
    );
  }
}
