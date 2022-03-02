import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen 3 :-)"),
        ),
        body: Stack(
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.red,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.blue,
            ),
            Container(
              width: 90,
              height: 90,
              color: Colors.green,
            ),
          ],
        )
    );
  }
}
