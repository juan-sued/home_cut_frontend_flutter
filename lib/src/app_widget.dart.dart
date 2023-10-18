import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_cut/src/provider/event_provider.dart';
import 'package:home_cut/src/screens/page_view.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color brownLight = const Color(0xFFDCC5AD);
    Color dark = const Color(0xFF2B2E35);
    Color blue = const Color(0xFF61A4AC);
    Color grey = Color(0x80d2d2d2);
    Color green = Colors.greenAccent;

    // Color brownDark = const Color(0xFF5A3D37);
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        home: PageViewWidget(),
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
          useMaterial3: true,
          brightness: Brightness.light,
          tooltipTheme: TooltipThemeData(
            verticalOffset: 48,
            height: 50,
          ),
          appBarTheme: AppBarTheme(
              foregroundColor: blue,
              surfaceTintColor: Colors.transparent,
              backgroundColor: brownLight),
          scaffoldBackgroundColor: brownLight,
          buttonTheme: ButtonThemeData(buttonColor: dark),
          primarySwatch: MaterialColor(0xFFDCC5AD, {
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
              brightness: Brightness.light,
              seedColor: Colors.white,
              primary: brownLight,
              secondary: dark,
              tertiary: blue),
          textTheme: TextTheme(
            //displays
            displayLarge: GoogleFonts.bebasNeue(
              fontSize: 72,
            ),
            displayMedium: GoogleFonts.bebasNeue(
              fontSize: 32,
            ),

            displaySmall: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),

            //headers

            headlineLarge: GoogleFonts.poppins(
              fontSize: 42,
            ),
            headlineMedium: GoogleFonts.poppins(
              fontSize: 32,
            ),
            headlineSmall: GoogleFonts.poppins(
              fontSize: 20,
            ),
            //titles

            titleLarge: GoogleFonts.poppins(
              fontSize: 32,
            ),
            titleMedium: GoogleFonts.poppins(
              fontSize: 22,
            ),
            titleSmall: GoogleFonts.poppins(
              fontSize: 18,
            ),
            //bodys
            bodyLarge: GoogleFonts.poppins(fontSize: 16),
            bodyMedium: GoogleFonts.poppins(fontSize: 14),
            bodySmall: GoogleFonts.poppins(fontSize: 12),

            //labels
            labelLarge: GoogleFonts.poppins(fontSize: 24),
            labelMedium: GoogleFonts.poppins(fontSize: 16, color: grey),
            labelSmall: GoogleFonts.poppins(
                fontSize: 9, fontWeight: FontWeight.w500, color: grey),
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
            brightness: Brightness.dark,

            //
            //            === DATE_PICKER ===
            //

            datePickerTheme: DatePickerThemeData(
              dayForegroundColor: MaterialStatePropertyAll(brownLight),
              headerHeadlineStyle:
                  GoogleFonts.bebasNeue(fontSize: 45, shadows: [
                Shadow(
                  blurRadius: 10, // Define o raio do desfoque da sombra
                  color:
                      Colors.black.withOpacity(0.1), // Define a cor da sombra
                  offset: Offset(2, 2), // Define o deslocamento da sombra
                ),
                Shadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(-2, -2),
                ),
              ]),
              headerForegroundColor: brownLight,
              weekdayStyle: TextStyle(color: grey),
              headerBackgroundColor: Colors.greenAccent.withOpacity(0.1),
              rangePickerHeaderHeadlineStyle: TextStyle(color: green),
              headerHelpStyle: TextStyle(color: brownLight),
              dayOverlayColor:
                  MaterialStateProperty.all(green.withOpacity(0.1)),
              dayStyle: GoogleFonts.poppins(fontSize: 16, shadows: [
                Shadow(
                  blurRadius: 10, // Define o raio do desfoque da sombra
                  color:
                      Colors.black.withOpacity(0.2), // Define a cor da sombra
                  offset: const Offset(2, 2), // Define o deslocamento da sombra
                ),
                Shadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(-2, -2),
                ),
              ]),
              yearOverlayColor: MaterialStateProperty.all(green),
              todayForegroundColor: MaterialStateProperty.all(green),
              todayBackgroundColor:
                  MaterialStateProperty.all(Colors.transparent),
              yearForegroundColor: MaterialStateProperty.all(brownLight),
              inputDecorationTheme: const InputDecorationTheme(
                  activeIndicatorBorder: BorderSide(color: Colors.grey)),
            ),

            //
            //            === TIME_PICKER ===
            //
            timePickerTheme: TimePickerThemeData(
              hourMinuteTextColor: Colors.white,
              dialHandColor: green,
              hourMinuteTextStyle: GoogleFonts.bebasNeue(
                fontSize: 55,
              ),
            ),
            //
            //
            //
            scaffoldBackgroundColor: dark,
            useMaterial3: true,
            //
            //            === TOOLTIP ===
            //
            tooltipTheme: const TooltipThemeData(
              verticalOffset: 48,
              height: 50,
            ),

            //
            //            === TEXT ===
            //
            textTheme: TextTheme(
              //displays
              displayLarge: GoogleFonts.bebasNeue(
                fontSize: 72,
                fontWeight: FontWeight.bold,
              ),
              displayMedium: GoogleFonts.bebasNeue(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),

              displaySmall: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              //headers

              headlineLarge: GoogleFonts.poppins(
                fontSize: 42,
              ),
              headlineMedium: GoogleFonts.poppins(
                fontSize: 22,
              ),
              headlineSmall: GoogleFonts.bebasNeue(
                fontSize: 16,
              ),

              //titles

              titleLarge: GoogleFonts.poppins(
                fontSize: 32,
              ),
              titleMedium: GoogleFonts.poppins(
                fontSize: 22,
              ),
              titleSmall: GoogleFonts.poppins(
                fontSize: 16,
              ),
              //bodys
              bodyLarge: GoogleFonts.poppins(fontSize: 16),
              bodyMedium: GoogleFonts.poppins(fontSize: 14),
              bodySmall: GoogleFonts.poppins(fontSize: 12),

              //labels
              labelLarge: GoogleFonts.poppins(fontSize: 24),
              labelMedium:
                  GoogleFonts.poppins(fontSize: 16, color: Colors.white),
              labelSmall: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w500, color: grey),
            ),
            //
            //             === COLOR_SCHEME ===
            //
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: Colors.white,
              primary: grey,
              secondary: brownLight,
              tertiary: green,
              background: dark,
            ),

            //
            //             === BUTTON ===
            //
            buttonTheme: ButtonThemeData(
              buttonColor: green,
            ),
            //
            //             === APPBAR ===
            //
            appBarTheme: AppBarTheme(
                foregroundColor: brownLight,
                surfaceTintColor: Colors.transparent,
                backgroundColor: dark)),
      ),
    );
  }
}
