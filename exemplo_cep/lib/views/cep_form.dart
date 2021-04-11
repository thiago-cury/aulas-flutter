import 'package:exemplo_cep/model/model.dart';
import 'package:exemplo_cep/service/service.dart';
import 'package:flutter/material.dart';

class CepForm extends StatefulWidget {
  @override
  _CepFormState createState() => _CepFormState();
}

class _CepFormState extends State<CepForm> {

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _cepController = new TextEditingController();

  String _data = "";
  bool _progress = false;

  _rowIcon() {
    return Icon(Icons.android, size: 150);
  }

  _rowCep() {
    return new TextFormField(
      controller: _cepController,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(hintText: "Digite o seu CEP"),
      maxLength: 8,
      validator: (value) {
        if(value.isEmpty) {
          return 'Digite um cep válido!';
        }
        return null;
      }
    );
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        _search(context);
        _resetFields();
      },
      label: Text('Buscar'),
      icon: Icon(Icons.search)
    );
  }

  _rowProgress() {
    return _progress ? CircularProgressIndicator() : Text(''); //cheiro gambiarra....
  }

  _rowResult() {
    return Row(
      children: [
        Expanded(child: Text('Seus dados: $_data', style: TextStyle(fontSize: 20.0),)),
      ],
    );
  }

  _rowForm(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          _rowIcon(),
          _rowCep(),
          _rowButton(context),
          _rowProgress(),
          _rowResult(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _rowForm(context),
    );
  }

  _search(BuildContext context) async {
    if(_formKey.currentState.validate()) {
      var cepService = CepService();

      //antes habilitar a progress
      setState(() {
        _progress = true;
      });

      Cep cep = await cepService.getCEP(CEP: _cepController.text); //vai demorar!!!

      //desabilitar a progress

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Resultado:\n${cep.toString()}'))
      );

      //para atualizar a tela
      setState(() {
        _data = cep.toString();
        _progress = false;
      });

    } else {
      print('erro! cep nao digitado...');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Digite o CEP corretamente :-/'))
      );
    }
  }

  _resetFields() => _formKey.currentState.reset();

}
