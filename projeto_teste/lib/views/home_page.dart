import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _size = 30.0; //atributos

  void _increaseSize() {
    setState(() {
      _size = _size + 15.0;
    });
  }

  void _decreaseSize() {
    setState(() {
      _size = _size - 15.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste :-)'),
      ),
      body: Column(
        children: [
          FlutterLogo(size: _size),
          Text('Tamanho atual: $_size'),
          TextButton(
            child: Text('Aumentar tamanho'),
            onPressed: () => _increaseSize(),
          ),
          TextButton(
            child: Text('Diminuir tamanho'),
            onPressed: () {
              _decreaseSize();
            },
          ),
        ],
      ),
    );
  }
}