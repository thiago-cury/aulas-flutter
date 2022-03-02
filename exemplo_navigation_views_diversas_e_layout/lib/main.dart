import 'package:flutter/material.dart';
import 'package:treinamento_segundo_dia/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo segundo dia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
/*
Buttons
http://www.macoratti.net/19/06/flut_widgt2.htm

layouts
http://www.macoratti.net/19/07/flut_layout2.htm

como inserir imagens
http://www.macoratti.net/19/07/flut_img1.htm
*/