import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Layout com guias'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.android),),
              // Text('Guia 1'),
              // Text('Guia 2'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Primeira tab....'),),
            Center(child: Text('Segunda tab....'),),
          ],
        ),
      ),
    );
  }
}

// Exercicio 11-
//
// -> Fazer o vídeo de ontem...... segundo vídeo...
// -> a primeira aula de flutter que todo mundo deveria ter...
// -> https://www.youtube.com/watch?v=J4BVaXkwmM8
// -> fazer o vídeo de material app e scaffold.... (dividir os arquivow)
// -> Fazer o vídeo de tabbar

