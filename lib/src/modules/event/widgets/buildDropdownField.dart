import 'package:flutter/material.dart';

Widget buildDropdownField({
  required String text,
  required VoidCallback onClicked,
}) =>
    ListTile(
      title: Text(text),
      trailing: const Icon(Icons.arrow_drop_down_rounded),
      onTap: onClicked,
    );
