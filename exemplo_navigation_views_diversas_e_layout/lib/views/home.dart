import 'package:flutter/material.dart';
import 'package:treinamento_segundo_dia/views/screen6.dart';
// import 'package:treinamento_segundo_dia/views/Screen3.dart';
import 'Screen1.dart';
import 'Screen2.dart';
import 'Screen3.dart';
import 'Screen4.dart';
import 'Screen5.dart';
import 'Screen7.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu exemplo :-)"),
      ),
      body: Column(
       children: [
          RaisedButton(
            child: const Text("Screen 1"),
            color: Colors.red,
            elevation: 4.0,
            splashColor: Colors.yellow,
            onPressed: () {
              print("clicou");
              Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1()));
            },
          ),
           RaisedButton(
             child: const Text("Screen 2"),
             color: Colors.red,
             elevation: 4.0,
             splashColor: Colors.yellow,
             onPressed: () {
               print("clicou");
               Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
             },
           ),
         RaisedButton(
           child: const Text("Screen 3"),
           color: Colors.red,
           elevation: 4.0,
           splashColor: Colors.yellow,
           onPressed: () {
             print("clicou");
             Navigator.push(context, MaterialPageRoute(builder: (context) => Screen3()));
           },
         ),
         RaisedButton(
           child: const Text("Screen 4"),
           color: Colors.red,
           elevation: 4.0,
           splashColor: Colors.yellow,
           onPressed: () {
             print("clicou");
             Navigator.push(context, MaterialPageRoute(builder: (context) => Screen4()));
           },
         ),
         RaisedButton(
           child: const Text("Screen 5"),
           color: Colors.red,
           elevation: 4.0,
           splashColor: Colors.yellow,
           onPressed: () {
             print("clicou");
             Navigator.push(context, MaterialPageRoute(builder: (context) => Screen5()));
           },
         ),
         RaisedButton(
           child: const Text("Screen 6"),
           color: Colors.red,
           elevation: 4.0,
           splashColor: Colors.yellow,
           onPressed: () {
             print("clicou");
             Navigator.push(context, MaterialPageRoute(builder: (context) => Screen6()));
           },
         ),
         RaisedButton(
           child: const Text("Screen 7"),
           color: Colors.red,
           elevation: 4.0,
           splashColor: Colors.yellow,
           onPressed: () {
             print("clicou");
             Navigator.push(context, MaterialPageRoute(builder: (context) => Screen7()));
           },
         )
       ],
      )
    );
  }
}
