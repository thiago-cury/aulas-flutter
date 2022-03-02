import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> _items = [];
  bool _isRunning = true;
  bool _buttonCoffeeBreak = false;
  bool _buttonLunch = false;

  void _addItem() {
    final DateTime now = DateTime.now();
    setState(() {
      print("HORA: ${now}");
      _items.add("${now.hour}:${now.minute}:${now.second}");
      if(now.hour == 22) {
        _buttonCoffeeBreak = true;
        _buttonLunch = false;
      } else {
        _buttonCoffeeBreak = false;
        _buttonLunch = true;
      }
    });
  }

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (!_isRunning) {
        timer.cancel();
      }
      _addItem();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("xxx"),),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (_, index) {
              return Card(
                margin: const EdgeInsets.all(10),
                color: Colors.amber,
                elevation: 5,
                child: ListTile(
                  title: Text(_items[index]),
                ),
              );
            },
          )),
          Visibility(child: Text("CAFÉEE", style: TextStyle(fontSize: 20.0),), visible: _buttonCoffeeBreak,),
          Visibility(child: Text("ALMOÇO", style: TextStyle(fontSize: 20.0),), visible: _buttonLunch,),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isRunning = false;
          });
        },
        child: const Icon(Icons.stop_circle),
      ),
    );
  }
}

