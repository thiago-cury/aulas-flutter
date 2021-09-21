import 'package:exemplo_navegacao/app/app.dart';
import 'package:exemplo_navegacao/views/views.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    String name = ModalRoute.of(context)!.settings.arguments as String;

    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Screen1View(name),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}