import 'package:flutter/material.dart';
import 'package:home_cut/myapp.dart';
import 'package:home_cut/provider/page_controller_provider.dart';
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
