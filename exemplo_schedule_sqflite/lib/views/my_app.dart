import 'package:exemplo_sqflite/views/views.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbearia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Agenda barbearia'),
    );
  }
}