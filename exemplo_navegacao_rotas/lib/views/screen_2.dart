import 'package:exemplo_navegacao/app/app.dart';
import 'package:exemplo_navegacao/views/views.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Screen2View(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}