import 'package:flutter/material.dart';
import 'app/app.dart';
import 'views/views.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - exemplo navegacao',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home('Flutter - exemplo navegaçao'),
      onGenerateRoute: App().getAppRoutes().getRoutes,
    );
  }
}