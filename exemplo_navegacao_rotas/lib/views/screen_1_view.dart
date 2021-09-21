import 'package:exemplo_navegacao/app/app_routes.dart';
import 'package:flutter/material.dart';

class Screen1View extends StatefulWidget {

  final String name;

  Screen1View(this.name);

  @override
  _Screen1ViewState createState() => _Screen1ViewState();
}

class _Screen1ViewState extends State<Screen1View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Tela 1'),),
      body: Column(
        children: [
          Center(
            child: Text('Tela 1'),
          ),
          Text('Nome enviado: ${widget.name}'),
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