import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text('Tela 1'),),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Screen 1'),
              TextButton.icon(
                icon: Icon(Icons.add),
                label: Text('Voltar para a Home'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ]
        )
    );
  }
}
