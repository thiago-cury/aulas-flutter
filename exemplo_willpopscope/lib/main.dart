import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) :super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Opa, onde vai?'),
        content: new Text('Você deseja sair do App?'),
        actions: <Widget>[
          TextButton.icon(
          style: TextButton.styleFrom(
              primary: Colors.white,
              padding: EdgeInsets.all(20.0),
              backgroundColor: Theme.of(context).primaryColor
          ),
            label: new Text('Oh no! Oh no, no no no...'),
            icon: Icon(Icons.dnd_forwardslash, color: Colors.white,),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.all(20.0),
                backgroundColor: Theme.of(context).primaryColor
            ),
            label: new Text('Sim'),
            icon: Icon(Icons.check, color: Colors.white,),
            onPressed: () => Navigator.of(context).pop(true),
          )
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Home Page"),
        ),
        body: new Center(
          child: new Text("Home Page"),
        ),
      ),
    );
  }
}