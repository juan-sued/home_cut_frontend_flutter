import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(Uno.new);

    super.exportedBinds(i);
  }
}
