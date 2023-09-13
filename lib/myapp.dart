import 'package:flutter/material.dart';
import 'package:home_cut/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeCut',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: true,
      ),
      home:  const HomePage(title: 'Home Cut')
    );
  }
}