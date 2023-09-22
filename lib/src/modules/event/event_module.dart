import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_cut/src/modules/auth/auth_module.dart';
import 'package:home_cut/src/modules/event/services/event_service.dart';
import 'package:home_cut/src/modules/event/views/home_page.dart';

class EventModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
  }
}
