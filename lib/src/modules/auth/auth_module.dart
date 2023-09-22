import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void exportedBinds(Injector i) {
    //expotado para outros módulos

    super.exportedBinds(i);
  }

  @override
  void binds(Injector i) {
    //disponível apenas no módulo atual

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
  }
}
