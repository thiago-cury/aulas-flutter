import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen 4 :-)"),
        ),
        body: Stack(
          children: [
            Image.network("https://pbs.twimg.com/media/D4FT8OZW4AAcmGc.jpg"),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Isso é uma rosquinha quente!",
              style: TextStyle(color: Colors.white, fontSize: 20.0),)
            )
          ],
        )
    );
  }
}
