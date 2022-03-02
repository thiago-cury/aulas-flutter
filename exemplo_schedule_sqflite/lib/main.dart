import 'package:exemplo_sqflite/views/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//SQLite - relacional - gerar um arquivo dentro do diretório do aplicativo....
//android  -> banco.sqlite
//ios -> banco.sqlite

//tabelas

// client
//
// id    name    email
// 1   thiago    thiagocury@gmail.com
// 2   mauricio  mauricio@hotmail.com
// 3   joana     joana@bol.com.br

//nome -> barbershop.db

// schedule
// id  name   phone        date       hour    kindOfService
// 1   Thiago 51982092209 20/08/2021 15:00 jogar video game