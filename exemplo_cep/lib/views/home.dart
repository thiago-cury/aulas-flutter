import 'package:exemplo_cep/views/views.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text('Exemplo CEP'),),
      body: CepForm(),
    );
  }
}
