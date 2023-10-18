import 'package:flutter/material.dart';
import 'package:home_cut/src/app_widget.dart.dart';
import 'package:home_cut/src/provider/page_controller_provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then((_) {
    runApp(
      ChangeNotifierProvider(
        create: (context) => PageControllerProvider(),
        child: MyApp(),
      ),
    );
  });
}
