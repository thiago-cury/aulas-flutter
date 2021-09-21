import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - Flipcard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter - Flipcard'),
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

  GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  _renderBackground() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
    );
  }

  _renderBack() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Center(
        child: Image.network('https://www.bamfestas.com.br/557-tm_thickbox_default/balao-metalizado-carta-de-baralho.jpg')
      ),
    );
  }

  _renderFront() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Center(
        child: Text(
          'Clique aqui', style: TextStyle(fontSize: 22.0, color: Colors.white),
        ),
      ),
    );
  }

  _renderCard(BuildContext context) {
    //renderizar o cartao....
    //back e front...
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 50.0, bottom: 100.0),
      color: Colors.white,
      child: FlipCard(
        key: _cardKey,
        flipOnTouch: true,
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          print('status: $status');
        },
        front: _renderFront(),
        back: _renderBack(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _renderBackground(),
          Column(
            children: [
              Expanded(
                child: _renderCard(context),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _cardKey.currentState!.toggleCard();
        },
        tooltip: 'Test',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
