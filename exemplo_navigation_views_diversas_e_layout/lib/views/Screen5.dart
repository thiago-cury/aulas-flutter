import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen 5 :-)"),
        ),
        body: Column(
          children: [
            // Container(width: 100, height: 100,),
            // SizedBox(height: 50,),
            Padding(
              padding: EdgeInsets.all(40.0),
              child: Text("Orbita gurizadaaa"),
            ),
            // Text("Orbita gurizadaaa"),
            // SizedBox(height: 50,),
            // Container(width: 100, height: 100,),
            Image.asset("images/orbita.jpg", fit: BoxFit.fill,)
          ],
        )
    );
  }
}
