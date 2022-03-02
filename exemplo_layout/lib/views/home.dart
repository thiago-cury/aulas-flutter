import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //CTRL + /
  // Widget _textCenter() {
  //   return Center(
  //     child: const DecoratedBox(
  //       decoration: const BoxDecoration(color: Colors.orange),
  //       child: Text('Thiago Cury', style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 50.0,
  //         fontWeight: FontWeight.bold,
  //       ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _textWithAlign() {
  //   return Align(
  //     alignment: Alignment.bottomRight,
  //     child: Text('Thiago Cury'),
  //   );
  // }

  // Widget _textWithContainer() {
  //   return Container(
  //     margin: EdgeInsets.all(20.0),
  //     padding: EdgeInsets.fromLTRB(2,2,2,2),
  //     alignment: Alignment.center,
  //     width: 300,
  //     height: 100,
  //     decoration: BoxDecoration(
  //         color: Colors.green,
  //         border: Border.all(width: 10, color: Colors.blueAccent)
  //     ),
  //     child: Text('Thiago Cury', style: TextStyle(fontSize: 50),),
  //   );
  // }

  // Widget _singleChildColumnRow() {
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //         SizedBox(height: 50,),
  //         Row(
  //           children: [
  //             Icon(Icons.home, size: 100.0,),
  //             Icon(Icons.list, size: 100.0,),
  //             Icon(Icons.android, size: 100.0,),
  //           ],
  //         ),
  //         SizedBox(height: 50,),
  //         Row(
  //           children: [
  //             Icon(Icons.home, size: 100.0,),
  //             Icon(Icons.list, size: 100.0,),
  //             Icon(Icons.android, size: 100.0,),
  //           ],
  //         ),
  //         SizedBox(height: 50,),
  //         Column(
  //           children: [
  //             Icon(Icons.home, size: 100.0,),
  //             Icon(Icons.list, size: 100.0,),
  //             Icon(Icons.android, size: 100.0,),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _iconsWithExpanded() {
  //   return Row(
  //     children: [
  //       Expanded(flex: 5, child: Icon(Icons.home, size: 40.0)),
  //       Expanded(flex: 1, child: Icon(Icons.list, size: 40.0)),
  //       Expanded(flex: 2, child: Icon(Icons.android, size: 40.0)),
  //       Expanded(flex: 1, child: Icon(Icons.access_alarm, size: 40.0)),
  //     ],
  //   );
  // }

  // Widget _containerWithExpanded() {
  //   return Row(
  //     children: [
  //       Expanded(
  //         flex: 3,
  //         child: Container(
  //           width: 100,
  //           height: 500,
  //           color: Colors.green,
  //         ),
  //       ),
  //       Expanded(
  //         flex: 1,
  //         child: Container(
  //           width: 100,
  //           height: 500,
  //           color: Colors.yellow,
  //         ),
  //       )
  //     ],
  //   );
  // }

  // Widget _containerWithFractionally() {
  //   return FractionallySizedBox( //porcentagem... matemática....
  //     widthFactor: 1,
  //     heightFactor: 0.5,
  //     child: Container(
  //       decoration: BoxDecoration(
  //           color: Colors.red,
  //           // border: Border.all(width: 10, color: Colors.white)
  //       ),
  //     ),
  //   );
  // }

  // Widget _containerWithPadding() {
  //   return Padding(
  //       padding: EdgeInsets.all(10),
  //       child: FractionallySizedBox( //porcentagem... matemática....
  //         widthFactor: 1,
  //         heightFactor: 1,
  //         child: Container(
  //           color: Colors.red,
  //         ),
  //       ),
  //   );
  // }

  // Widget _containerWithStack() {
  //   return Stack(
  //     children: [
  //       Container(
  //         width: 300,
  //         height: 300,
  //         color: Colors.red,
  //       ),
  //       Align(
  //         alignment: Alignment.bottomCenter,
  //         child: Container(
  //           width: 200,
  //           height: 200,
  //           color: Colors.green,
  //         ),
  //       ),
  //       Positioned(
  //           left: 50,
  //           top: 100,
  //           child: Container(
  //             width: 100,
  //             height: 100,
  //             color: Colors.yellow,
  //           )
  //       )
  //     ],
  //   );
  // }

  // Widget _containerStackWithImage() {
  //   return Stack(
  //     children: [
  //       Image.network('https://www.iset.com.br/blog/wp-content/uploads/2017/05/afinal-o-que-e-uma-plataforma-mobile.jpeg'),
  //       Positioned(
  //         child: Text('Tomando cafézin e testando o Appzin em Flutter'),
  //         top: 200,
  //         left: 30,
  //       )
  //     ],
  //   );
  // }

  Widget _rowColumn() {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: Colors.green,
          child: FlutterLogo(size: 50.0,),
        ),
        Container(
          color: Colors.yellow,
          child: FlutterLogo(size: 50.0,),
        ),
        Container(
          color: Colors.blue,
          child: FlutterLogo(size: 50.0,),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo layout'),),
      // body: Text('a', style: TextStyle(fontSize: 50.0),)
      // body: _textCenter(),
      // body: _textWithAlign(),
      // body: _textWithContainer(),
      // body: _singleChildColumnRow()
      // body: _iconsWithExpanded()
      // body: _containerWithExpanded()
      // body: _containerWithFractionally()
      // body: _containerWithPadding()
      // body: _containerWithStack()
      // body: _containerStackWithImage()
      // body: _rowColumn()
    );
  }
}