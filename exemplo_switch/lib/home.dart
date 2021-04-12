import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  final String title;

  Home(this.title);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _fieldController = new TextEditingController();

  bool _isSwitched = false;

  _rowSwitch() {
    return Switch(
      value: _isSwitched,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
          FocusScope.of(context).unfocus();
          _fieldController.clear();
          print(_isSwitched);
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
    );
  }

  _rowField() {
    return _isSwitched
    ? new TextFormField(
        controller: _fieldController,
        keyboardType: TextInputType.emailAddress,
        decoration: new InputDecoration(hintText: "Digite o email"),
        maxLength: 50,
        validator: (value) {
          if(value.isEmpty) {
            return 'Digite um email válido!';
          }
          return null;
        },
      )
    : new TextFormField(
      controller: _fieldController,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(hintText: "Digite o ID"),
      maxLength: 9,
      validator: (value) {
        if(value.isEmpty) {
          return 'Digite um ID válido!';
        }
        return null;
      },
    );
  }

  _rowButton() {
    return TextButton.icon(
        icon: Icon(Icons.add),
        label: Text('Cadastrar'),
        onPressed: () {
          print('teste textformfield e switched');
          print('Voce digitou: ${_fieldController.text}');
          print('Voce escolheu no switch: ${_isSwitched}');
        },
    );
  }

  _formUI(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            _rowField(),
            Text('Escolha o tipo de teclado no Switch...'),
            _rowSwitch(),
            _rowButton(),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}'),),
      body: ListView(
        children: [
          _formUI(context)
        ],
      ),
    );
  }
}
