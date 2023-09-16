import 'package:flutter/material.dart';
import 'package:home_cut/myapp.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then((_) {
    runApp(MyApp());
  });
}
