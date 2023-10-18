import 'package:flutter/material.dart';

buildHeader({required String header, required Row child}) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        child,
      ],
    );
