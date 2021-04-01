import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text('Tela 2'),),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Screen 2'),
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
