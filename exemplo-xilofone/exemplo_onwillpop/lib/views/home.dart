import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {

  final String title;

  Home(this.title);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _willPop(BuildContext context) {
    print('clicou no back button');
    //comportamento do meu backbutton....
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Você deseja sair do App?"),
        actions: [
          TextButton(
              child: Text('Sim'),
              onPressed: () {
                _flutterToast('Tchauu até a próxima :-)');
                if(Platform.isAndroid) {
                  exit(0);
                } else if(Platform.isIOS) {
                  Navigator.of(context).pop(true);
                }
              },
          ),
          TextButton(
            child: Text('Não'),
            onPressed: () {
              Navigator.of(context).pop(false);
              _flutterToast('Ohh nooo noo Oh noo noo :-/');
            },
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _willPop(context),
        child: Scaffold(
          appBar: AppBar(title: Text('Exemplo on will pop scope'), centerTitle: true,),
          body: Column(
            children: [
              Text('Exemplo ...')
            ],
          ),
        ),
    );
  }

  _flutterToast(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
