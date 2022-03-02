import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imc_block/ios/home.dart';

class IOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "IMC iOS",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
