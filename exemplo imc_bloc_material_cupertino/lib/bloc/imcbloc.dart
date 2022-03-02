import 'dart:async';

import 'package:flutter/cupertino.dart';

class ImcBloc {

  String _imc = "";
  var heightCtrl = new TextEditingController();
  var weightCtrl = new TextEditingController();
  var result = "Preencha os dados para calcular seu IMC";

  String get imc => _imc;

  final _blocController = StreamController<String>();

  Stream<String> get myStream => _blocController.stream;

  calculate() {
    double weight = double.parse(weightCtrl.text);
    double height = double.parse(heightCtrl.text) / 100;
    double imc = weight / (height * height);

    if (imc < 18.6) {
      result = "Abaixo do Peso (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 18.6 && imc <= 24.9) {
      result = "Peso Ideal (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 24.9 && imc <= 29.9) {
      result = "Levemente acima do peso (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 24.9 && imc <= 34.9) {
      result = "Obesidade Grau I (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 34.9 && imc <= 39.9) {
      result = "Obesidade Grau II (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 40) {
      result = "Obesidade Grau III (${imc.toStringAsPrecision(2)})";
    }

    _blocController.add(result);
  }

  void resetFields() {
    heightCtrl.text = "";
    weightCtrl.text = "";
    _blocController.add("");
  }

  void closeStream() {
    _blocController.close();
  }
}