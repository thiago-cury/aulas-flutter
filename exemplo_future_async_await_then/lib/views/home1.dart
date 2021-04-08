import 'dart:math';

import 'package:flutter/material.dart';

class Home1 extends StatefulWidget {

  final String title;
  Home1(this.title);

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {

  // int _randomicNumber = 0;
  // int _count = 0;
  // bool _progress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Text('Número randomico: $_randomicNumber', style: TextStyle(fontSize: 20)),
          // _progress ? CircularProgressIndicator() : Text('é só clicar...'),
          // Text('Contador: $_count', style: TextStyle(fontSize: 20)),
          StreamBuilder(
            stream: countForOneMinute(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if(snapshot.hasError) {
                return Center(
                  child: Text('Erro!'),
                );
              }
              return Text('Contador: ${snapshot.data}');
            },
          ),
          // TextButton(
          //   onPressed: () async {
          //     print('clicou');
          //
          //     // setState(() {
          //     //   _progress = true;
          //     // });
          //     //
          //     // int number = await _generateRandomicNumber();
          //     //
          //     // setState(() {
          //     //   _randomicNumber = number;
          //     //   _progress = false;
          //     // });
          //
          //     //stream - async*
          //     // await for(int i in countForOneMinute()) {
          //     //   setState(() {
          //     //     print(i);
          //     //     _count = i;
          //     //   });
          //     // }
          //
          //   },
          //   child: Text('Clique aqui!'),
          // )
        ],
      ),
    );
  }

  //async ->>>> prover um Future.....
  //utilizamos async sempre que precisarmos retornar um valor de forma assíncrona....
  Future<int> _generateRandomicNumber() async {
    var random = Random();
    await Future.delayed(const Duration(seconds: 3));
    return random.nextInt(6);
  }

  //async*
  //adicionamos o * quando precisamos stremar um resultado..... ou seja, preciso que fique enviando o resultado
  //para a tela. tipo de retorno -> Stream
  Stream<int> countForOneMinute() async* {
    for(int i=0 ; i<60 ; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

}