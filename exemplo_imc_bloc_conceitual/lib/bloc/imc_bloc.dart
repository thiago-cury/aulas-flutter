import 'dart:async';
import 'package:exemplo_imc_bloc_conceitual/model/model.dart';
import 'package:flutter/material.dart';

class IMCBloc {

  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var result = "Preencha os dados para calcular o IMC";

  final _blocController = StreamController<String>();

  Stream<String> get myStream => _blocController.stream;

  IMCBloc() {
    _blocController.add(result);
  }

  calculate() {
    var imc = Imc(double.parse(weightController.text), double.parse(heightController.text));
    _blocController.add(imc.calculate().toString());
  }

  void resetFields() {
    heightController.text = "";
    weightController.text = "";
    _blocController.add("Preencha os dados para calcular o IMC");
  }

  void closeStream() {
    _blocController.close();
  }

}