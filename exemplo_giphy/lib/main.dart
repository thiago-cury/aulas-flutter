import 'package:flutter/material.dart';

import 'views/views.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - Giphy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home('Flutter - Giphy'),
    );
  }
}

//Erros:
//main - 15 - debugShowCheckedModeBanner: false,
//home - 156 - appBar: AppBar(title: Text('${widget.title}'),),
//173/174 home
//'limit' : '19',
//'offset' : '$_offset',
//textfield - texto em branco
//home - 42 - style: TextStyle(color: Colors.black, fontSize: 18.0),
//clicou para a página de detalhe...
//button carregar mais