import 'package:exemplo_navegacao/app/app_routes.dart';
import 'package:flutter/material.dart';

class Screen2View extends StatefulWidget {
  @override
  _Screen2ViewState createState() => _Screen2ViewState();
}

class _Screen2ViewState extends State<Screen2View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Tela 2'),),
      body: Column(
        children: [
          Center(
            child: Text('Tela 2'),
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