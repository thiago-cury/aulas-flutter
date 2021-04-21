import 'package:exemplo_sqflite/model/model.dart';
import 'package:flutter/material.dart';

class RegisterContact extends StatefulWidget {

  final Contact contact;

  RegisterContact(this.contact);

  @override
  _RegisterContactState createState() => _RegisterContactState();
}

class _RegisterContactState extends State<RegisterContact> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  _rowName() {
    return TextField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: "Nome"),
    );
  }

  _rowEmail() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: "Email"),
    );
  }

  _rowPhone() {
    return TextField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(labelText: "Telefone"),
    );
  }

  _rowRegister(BuildContext context) {
    return TextButton(
      onPressed: () {
        print('clicou registrar');

        widget.contact.name = _nameController.text;
        widget.contact.email = _emailController.text;
        widget.contact.phone = _phoneController.text;

        print("contato: ${widget.contact.toString()}");

        Navigator.pop(context, widget.contact);
      },
      child: Text('Registrar'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de contato'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _rowName(),
            _rowEmail(),
            _rowPhone(),
            _rowRegister(context)
          ],
        ),
      ),
    );
  }
}
