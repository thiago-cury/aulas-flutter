import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'model/person.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - msg',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter - msg'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text('aaa'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('enviou mensagem');

          final person = Person();
          person.name = "Thiago";
          person.lastname = "Cury";
          person.age = 37;

          // _toast('Thiago');
          // _snack('Uolll snack!');
          //_showAlert('Você clicou no alert... sim ou não ?!'); //sem passar o título
          //_showAlert('Você clicou no alert... sim ou não ?!', title: 'ERRO'); //passar o título
          _showAlert('${person.toString()}', title: 'Resposta :-)', yesButton: 'Yes Sir/Miss', noButton: 'Oh noo noo!'); //passar o título
        },
        tooltip: '...',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _showAlert(String message, {String title, String yesButton, String noButton}) { //opcional nomeado...
    AlertDialog alert = AlertDialog(
      title: Text(title ?? 'Atenção'),
      content: Text(message),
      actions: [
        TextButton(onPressed: () {
          print('clicou no sim');
          Navigator.of(context).pop();
        }, child: Text(yesButton ?? 'sim')),
        // TextButton(onPressed: () {
        //   print('clicou no não');
        //   Navigator.of(context).pop();
        // }, child: Text(noButton ?? 'não')),
      ],
    );

    showDialog(context: context, builder: (BuildContext context) {
      return alert;
    });
  }

  // void _snack(String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),));
  // }

  // void _toast(String message) {
  //   Toast.show(message, context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  // }
}
