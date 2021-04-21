import 'package:exemplo_sqflite/views/views.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

//1 - pubspec
//https://pub.dev/packages/sqflite/install

//2 - contact
//3 - model
//4 - contact_helper
//5 - db
//6 -
