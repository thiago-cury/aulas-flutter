import 'package:flutter/material.dart';

class Screen6 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen 6 :-)"),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.indigo[700],
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.android,
                      color: Colors.green,
                    ),
                  ),
                  Text("Thiago Cury",
                  style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.email,
                      color: Colors.green,
                    ),
                  ),
                  Text("thiagocury@gmail.com",
                      style: TextStyle(color: Colors.white))
                ],
              )
            ],
          ),
        )
    );
  }
}
