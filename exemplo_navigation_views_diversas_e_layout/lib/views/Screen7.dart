import 'package:flutter/material.dart';

class Screen7 extends StatefulWidget {
  @override
  _Screen7State createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {

  TextEditingController _number1Controller = new TextEditingController();
  TextEditingController _number2Controller = new TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _response = "Informe os números";

  //MVC - lixo
  //MVP - model view presenter - em desuso
  //MVVM - model view view model - bastante utilizado
  //Viper
  //flutter em especifico - BloC - Bussiness lógic - conceito.... indianos...

  void _resetFields() {
    setState(() {
      _number1Controller.text = "";
      _number2Controller.text = "";
      _response = "Informe os números";
    });
  }

  void _calculate() {
    setState(() {
      double number1 = double.parse(_number1Controller.text);
      double number2 = double.parse(_number2Controller.text);
      double sum = number1 + number2;
      print("soma: $sum");
      _response = "A soma é: $sum";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Icon(Icons.android, size: 120),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite o número 1",
                  labelStyle: TextStyle(color: Colors.blue)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 25.0),
                controller: _number1Controller,
                validator: (value) {
                  if(value.isEmpty) {
                    return "Insira o número 1";
                  }
                },
              ),
              TextFormField(
                  controller: _number2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Digite o número 2",
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Insira o número 2";
                    }
                  }
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text("Calcular"),
                    onPressed: () {
                      print("clicou no calcular");
                      if(_formKey.currentState.validate()) {
                        _calculate();
                      }
                    }
                  )
                )
              ),
              Text(_response)
            ],
          )
        ),
      ),
    );
  }
}

