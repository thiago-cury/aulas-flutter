import 'dart:developer';

import 'package:ex_modular/app/modules/bas/bas_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {

  @override
  List<Module> get imports => [
    BasModule()
  ];

  @override
  final List<Bind> binds = [
    Bind.instance<String>('Thiago Cury'),
    Bind.factory((i) => Controller()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];

}

class Controller {
  printText() {
    print('oi do controller');
  }
}