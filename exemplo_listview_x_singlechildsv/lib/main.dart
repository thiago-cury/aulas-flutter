import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - ListView x SingleChildScrollView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter - ListView x SingleChildScrollView'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //Exemplo ListView com builder
  final List<String> entries = <String>['Texto 1', 'Texto 2', 'Texto 3'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title),
  //     ),
  //     body: ListView.builder(
  //         padding: const EdgeInsets.all(8.0),
  //         itemCount: entries.length, //3
  //         itemBuilder: (BuildContext context, int index) {
  //           return Container(
  //             height: 500,
  //             color: Colors.red[colorCodes[index]],
  //             child: Text(entries[index]),
  //           );
  //         }
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //       },
  //       tooltip: 'Test',
  //       child: Icon(Icons.add),
  //     ), // This trailing comma makes auto-formatting nicer for build methods.
  //   );
  // }

  //ListView
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title),
  //     ),
  //     body: ListView(
  //       children: [
  //         Container(
  //           width: double.infinity,
  //           height: 500,
  //           color: Colors.green,
  //         ),
  //         Container(
  //           width: double.infinity,
  //           height: 500,
  //           color: Colors.orange,
  //         ),
  //         Container(
  //           width: double.infinity,
  //           height: 500,
  //           color: Colors.grey,
  //         ),
  //       ],
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //       },
  //       tooltip: 'Test',
  //       child: Icon(Icons.add),
  //     ), // This trailing comma makes auto-formatting nicer for build methods.
  //   );
  // }

  //SingleChildScrollView + Column
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 500,
              color: Colors.green,
            ),
            Container(
              width: double.infinity,
              height: 500,
              color: Colors.orange,
            ),
            Container(
              width: double.infinity,
              height: 500,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        tooltip: 'Test',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
