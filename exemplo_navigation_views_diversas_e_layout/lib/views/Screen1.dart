import 'package:flutter/material.dart';

// class Screen1 extends StatefulWidget {
//   @override
//   _Screen1State createState() => _Screen1State();
// }
//
// class _Screen1State extends State<Screen1> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Screen 1 :-)"),
//         ),
//         body: Column(
//           children: [
//             Text("Oi"),
//             RaisedButton(
//               child: const Text("Home"),
//               color: Colors.red,
//               elevation: 4.0,
//               splashColor: Colors.yellow,
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             )
//           ],
//         )
//     );
//   }
// }


class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen 1 :-)"),
        ),
        body: Column(
          children: [
            Text("Oi"),
            RaisedButton(
              child: const Text("Home"),
              color: Colors.red,
              elevation: 4.0,
              splashColor: Colors.yellow,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        )
    );
  }
}
