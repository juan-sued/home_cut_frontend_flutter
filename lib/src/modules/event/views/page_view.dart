import 'package:flutter/material.dart';
import 'package:home_cut/src/modules/event/views/event_editing_page.dart';
import 'package:home_cut/src/modules/event/views/home_page.dart';
import 'package:home_cut/provider/page_controller_provider.dart';
import 'package:provider/provider.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController =
        Provider.of<PageControllerProvider>(context, listen: false)
            .pageController;
    return PageView(
      controller: pageController,
      children: [HomePage(), EventEditingPage()],
    );
  }
}
