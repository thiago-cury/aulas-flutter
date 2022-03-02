import 'package:flutter/material.dart';
import 'package:testeflavor/HomePage.dart';

import '../app_config.dart';
import '../main.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'Clinica Qwe',
    flavorName: 'flavor -> QWE',
    apiBaseUrl: 'https://qwe.com/',
    child: new MyApp(),
  );

  runApp(configuredApp);
}