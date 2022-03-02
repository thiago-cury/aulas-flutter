import 'package:exemplo_weather/views/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repository/weather_repository.dart';
import 'bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

/* Exemplo retirado: https://github.com/themaaz32/WeatherAppWithBloc/ */

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Bloc",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[900],
          body: BlocProvider(
            lazy: false,
            create: (context) => WeatherBloc(WeatherRepo()),
            child: SearchPage(),
          )
      ),
    );
  }
}