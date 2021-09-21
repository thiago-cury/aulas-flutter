import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  final String title;
  Home(this.title);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double _count = 0;

  _backLayer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Pesquisa', style: TextStyle(fontSize: 26.0)),
          Text('Contador'),
          Text('Contador back: $_count', style: TextStyle(fontSize: 26.0)),
        ],
      ),
    );
  }

  _frontLayer() {
    return Center(
      child: Column(
        children: [
          Text('Conteúdo', style: TextStyle(fontSize: 26.0)),
          Text('Contador front: $_count', style: TextStyle(fontSize: 26.0)),
          Text('bbb', style: TextStyle(fontSize: 26.0)),
          Text('ccc', style: TextStyle(fontSize: 26.0)),
        ],
      ),
    );
  }

  _subHeader() {
    return BackdropSubHeader(
      title: Text("Subtitulo..."),
    );
  }

  @override
  Widget build(BuildContext context) {

    return BackdropScaffold(
        appBar: BackdropAppBar(
          title: Text(widget.title),
        ),
        backLayer: _backLayer(),
        frontLayer: _frontLayer(),
        subHeader: _subHeader(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('clicou');
            setState(() {
              _count++;
            });

          },
          tooltip: 'Text',
          child: Icon(Icons.add),
        ),
    );

  }
}
