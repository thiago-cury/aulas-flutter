import 'package:exemplo_internacionalizacao/translate/app_localizations.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).translate('title')),),
      body: Column(
        children: [
          Text(AppLocalizations.of(context).translate('message'))
        ],
      ),
    );
  }
}