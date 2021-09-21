import 'package:exemplo_navegacao/app/app_routes.dart';
import 'package:flutter/material.dart';

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Sobre'),),
      body: Column(
        children: [
          Center(
            child: Text('Sobre'),
          ),
          TextButton.icon(
            icon: Icon(Icons.arrow_back),
            label: Text('Voltar para home'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.appRouteHome);
            },
          ),
        ],
      ),
    );
  }
}