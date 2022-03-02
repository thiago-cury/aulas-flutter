import 'package:flutter/material.dart';
import 'package:testeflavor/HomePage.dart';
import 'package:testeflavor/main.dart';

import '../app_config.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'Clinica Xyz',
    flavorName: 'flavor -> XYZ',
    apiBaseUrl: 'https://xyz.com/',
    child: new MyApp(),
  );

  runApp(configuredApp);
}