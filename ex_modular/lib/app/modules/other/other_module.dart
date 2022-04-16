import 'package:flutter_modular/flutter_modular.dart';

class OtherModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => ControllerWithInjection(i(), i())), //ou i<String>()
  ];

  @override
  final List<ModularRoute> routes = [];

}

class ControllerWithInjection {

  String name;
  bool isInjected;

  ControllerWithInjection(this.name, this.isInjected);

  printText() {
    print('oi $name - $isInjected');
  }
}