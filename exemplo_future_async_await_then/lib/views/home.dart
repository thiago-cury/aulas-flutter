import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatefulWidget {

  final String title;
  Home(this.title);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _name = "";
  String _house = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text('Feito $_name'),
          Text('Casa escolhida para voce: $_house'),
          TextButton(
            onPressed: () async {
              print('clicou');
              setState(() {
                _name = _getName();
              });

              final URL = Uri.https('www.potterapi.com', '/v1/sortingHat');
              final myFuture = http.get(URL);

              myFuture.then((response) {
                if(response.statusCode == 200) {
                  print('tudo ok');

                  var jsonResponse = convert.jsonDecode(response.body);
                  print(jsonResponse);
                  setState(() {
                    _house = jsonResponse;
                  });
                } else {
                  print('deu ruim');
                }
              });

              // print(_sayHello()); //ele nao esperou.... Future<String>
              //
              // print(await _sayHello()); //ele está aguardando o resultado.....
              // print("aguardou");
              // print(await _sayHi()); //ele está aguardando o resultado.....

              // _waitForMe(); //o codigo nao vai esperar por ele....
              // await _waitForMe(); //o codigo vai esperar por ele....

              // _waitForMe().then((_) { //chamada de callback..... o código nao vai esperar por ele.
              //   print('passou no then..... acabou tudo.');
              // });

              // _waitForMe().then((_) { //chamada de callback..... o código nao vai esperar por ele.
              //   print('passou no then..... acabou tudo.');
              // }).catchError((error) {
              //   print('passou no catchError..... acabou com erro!');
              // });

              // print("uolllll");

            },
            child: Text('Clique aqui para ver o nome!'),
          )
        ],
      ),
    );

  }

  //main thread
  String _getName() {
    return 'Thiago';
  }

// Future<String> _sayHello() async {
//   var name = 'Hello';
//   return name;
// }
//
// Future<String> _sayHi() async {
//   return 'Hi';
// }
//
// Future _waitForMe() async {
//   print('iniciou');
//
//   return Future.delayed(Duration(seconds: 5), () {
//     print('finalizou');
//     setState( () {
//       _name = 'Joaoooooo foi...';
//     });
//   });
// }
}