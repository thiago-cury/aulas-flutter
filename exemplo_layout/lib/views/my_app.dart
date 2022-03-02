import 'package:exemplo_layout/views/views.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo layout',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
