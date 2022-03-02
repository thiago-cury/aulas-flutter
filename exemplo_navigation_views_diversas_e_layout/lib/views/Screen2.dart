import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {


  //private
  void _action() {
    print("oi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen 2 :-)"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(child: Icon(Icons.android),),
                Expanded(child: Icon(Icons.android),),
                Expanded(child: Icon(Icons.android),),
                Expanded(child: Icon(Icons.android),),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 2, child: Icon(Icons.android),),
                Expanded(flex: 2, child: Icon(Icons.android),),
                Expanded(flex: 5, child: Icon(Icons.android),),
                Expanded(flex: 1, child: Icon(Icons.android),),
              ],
            ),
            Column(
              children: [
                Icon(Icons.android),
                Icon(Icons.android),
                Icon(Icons.android),
                Icon(Icons.android),
                FlatButton(
                  child: Text("aaa"),
                  onPressed: _action,
                )
              ],
            )
          ]
        )
    );
  }
}
