import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {

  final String name;

  Screen2(this.name);

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
            children: [
              Text('Screen 2'),
              Text('Texto recebido: ${widget.name}'),
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