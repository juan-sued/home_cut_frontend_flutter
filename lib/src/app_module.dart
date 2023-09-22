import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_cut/src/modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];
}
