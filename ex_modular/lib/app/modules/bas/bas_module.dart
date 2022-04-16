import 'package:flutter_modular/flutter_modular.dart';

class BasModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.instance<bool>(true, export: true)
  ];

  @override
  final List<ModularRoute> routes = [];

}