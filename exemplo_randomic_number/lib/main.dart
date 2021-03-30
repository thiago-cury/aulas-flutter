import 'dart:math';

import 'package:flutter/material.dart';

import 'model/number.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Número randômico',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Número randômico'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _randomicNumber;

  void _generateNumber() {
    setState(() {
      _randomicNumber = Number.generateRandomicNumber();
    });
  }

  @override
  void initState() {
    super.initState();
    _generateNumber();
  }

  final snackBar = SnackBar(content: Text('uolll'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Número randômico',),),
      body: Column(
        children: [
          Text('Número da loteria', textAlign: TextAlign.center, style: TextStyle(fontSize: 50.0,),),
          Text('$_randomicNumber', style: TextStyle(fontSize: 50.0, backgroundColor: Colors.blue, color: Colors.white),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        tooltip: 'Randomic number',
        child: Icon(Icons.add),
      ),
    );
  }
}
