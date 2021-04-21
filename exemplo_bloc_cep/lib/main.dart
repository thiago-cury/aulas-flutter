import 'package:exemplo_cep/bloc/bloc.dart';
import 'package:exemplo_cep/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/views.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - BloC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter - BloC'),),
        body: BlocProvider(
          lazy: false,
          create: (context) => CepBloc(CepService()),
          child: Home(),
        ),
      ),
    );
  }
}