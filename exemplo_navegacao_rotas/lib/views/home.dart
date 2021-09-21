import 'dart:async';

import 'package:exemplo_navegacao/app/app_routes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  final String title;

  Home(this.title);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}'),),
      body: Column(
        children: [
          Center(
            child: Text('Home...'),
          ),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('Tela 1'),
            onPressed: () {
              Timer(const Duration(milliseconds: 400), () => Navigator.pushNamed(context, AppRoutes.appRouteScreen1, arguments: 'Thiago Cury'));
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('Tela 2'),
            onPressed: () {
              // Navigator.pushNamed(context, AppRoutes.APP_ROUTE_SCREEN_2);
              Timer(const Duration(milliseconds: 900), () => Navigator.pushNamed(context, AppRoutes.appRouteScreen2));
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('Sobre'),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.appRouteAbout);
            },
          ),
        ],
      ),
    );
  }
}