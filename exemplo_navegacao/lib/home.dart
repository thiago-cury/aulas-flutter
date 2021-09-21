import 'dart:async';
import 'package:flutter/material.dart';
import 'screen_1.dart';
import 'screen_2.dart';

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
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Exemplo navegação'),),
      body: Column(
        children: [
          Text('Home - ${widget.title}'),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('Tela 1'),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Screen1()));
              Timer(const Duration(milliseconds: 900), ()=>
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => Screen1())
                  )
              );
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('Tela 2'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Screen2('Thiago Cury')));
            },
          ),
        ],
      ),
    );
  }
}
