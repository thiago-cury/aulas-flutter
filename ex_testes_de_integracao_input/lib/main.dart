import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Integration test input',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Integration test input'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final myController = TextEditingController();

  _widgetTextField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: myController,
        key: const Key('text-field'),
      ),
    );
  }

  _widgetTextButton() {
    return TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(myController.text),
                key: const Key('response-alert'),
              );
            },
          );
        },
        child: const Text("OK"),
        key: const Key('button-ok'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _widgetTextField(),
            _widgetTextButton()
          ],
        ),
      ),
    );
  }
}
