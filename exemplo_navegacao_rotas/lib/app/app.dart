
import 'package:flutter/material.dart';

import 'app_routes.dart';

class App extends StatelessWidget {

  static final App _instance = App._internal();

  App._internal();

  factory App() => _instance;

  // desnecessario...
  // factory App() {
  //   return _instance;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: getAppRoutes().getRoutes,
    );
  }

  AppRoutes getAppRoutes() => AppRoutes();

  //desnecessario
  // AppRoutes getAppRoutes() {
  //   return AppRoutes();
  // }

}