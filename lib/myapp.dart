import 'package:flutter/material.dart';
import 'package:home_cut/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color brownLight = const Color(0xFFDCC5AD);
    Color dark = const Color(0xFF2B2E35);
    Color blue = const Color(0xFF61A4AC);
    Color brownDark = const Color(0xFF5A3D37);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        title: 'HomeCut',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          scaffoldBackgroundColor: brownLight,
          primarySwatch: const MaterialColor(0xFFDCC5AD, {
            50: Color(0xFFFFF7F2),
            100: Color(0xFFFFE0CC),
            200: Color(0xFFFFC29A),
            300: Color(0xFFFFA568),
            400: Color(0xFFFF8A41),
            500: Color(0xFFFF6F1B),
            600: Color(0xFFE16114),
            700: Color(0xFFBF510D),
            800: Color(0xFF9D4007),
            900: Color(0xFF7C3102),
          }),
          colorScheme: ColorScheme.fromSeed(
            seedColor: brownLight,
            primary: brownLight,
            secondary: blue,
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: dark,
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: brownLight,
              primary: brownLight,
              secondary: blue,
            ),
            appBarTheme: const AppBarTheme(
                foregroundColor: Color(0xFFDCC5AD),
                surfaceTintColor: Colors.transparent,
                backgroundColor: Color(
                  0xFF2B2E35,
                ))),
        home: const HomePage(title: 'HomeCut'));
  }
}
