import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, VoidCallback onPressed, String title,
    [List<Widget>? actions]) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    leading: CloseButton(onPressed: onPressed),
    actions: actions,
    titleTextStyle: TextStyle(shadows: [
      Shadow(
        blurRadius: 3.0,
        color: Colors.black.withOpacity(0.3),
        offset: const Offset(1, 1),
      ),
    ]),
    title: Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: Theme.of(context).colorScheme.secondary),
    ),
  );
}
