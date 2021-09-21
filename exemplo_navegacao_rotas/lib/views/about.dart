import 'package:exemplo_navegacao/app/app.dart';
import 'package:exemplo_navegacao/views/views.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: AboutView(),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}