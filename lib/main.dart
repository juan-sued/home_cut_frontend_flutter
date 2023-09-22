import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_cut/src/app_widget.dart.dart';
import 'package:home_cut/src/app_module.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then((_) {
    runApp(ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ));
  });
}
