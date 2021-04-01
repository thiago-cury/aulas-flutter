import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text('Sobre'),),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sobre'),
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