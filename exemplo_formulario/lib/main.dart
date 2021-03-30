import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/Person.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - Formulário',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter - Formulário'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();

  double _imc = 0.0;

  _rowIcon() {
    return Icon(Icons.people, size: 150,);
  }

  _rowName() {
    return new TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(hintText: "Digite o seu nome"),
      maxLength: 100,
      validator: (value) {
        if(value.isEmpty) {
          return 'Digite um valor válido!';
        }
        return null;
      },
    );
  }

  _rowWeight() {
    return new TextFormField(
      controller: _weightController,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(hintText: "Digite o seu peso"),
      maxLength: 10,
      validator: (value) {
        if(value.length < 2) {
          return 'Digite um peso válido!';
        }
        return null;
      },
    );
  }

  _rowHeight() {
    return new TextFormField(
      controller: _heightController,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
          hintText: "Digite a sua altura",
      ),
      maxLength: 10,
      validator: (value) {
        if(value.length < 2) {
          return 'Digite uma altura válida!';
        }
        return null;
      },
    );
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          _register(context);
          _resetFields();
        },
        label: Text('Cadastrar'),
        icon: Icon(Icons.add),
    );
  }

  _formUI(BuildContext context) {
    return Column(
      children: [
        _rowIcon(),
        _rowName(),
        _rowWeight(),
        _rowHeight(),
        _rowButton(context),
      ],
    );
  }

  _rowForm(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: _formUI(context),
    );
  }

  _rowIMC() {
    return Row(
      children: [
        Text('Seu IMC -> $_imc', style: TextStyle(fontSize: 20.0),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _rowForm(context),
            _rowIMC(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //   },
      //   tooltip: 'Test',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _register(BuildContext context) {
    print('Validou: ${_formKey.currentState.validate()}');

    if(_formKey.currentState.validate()) {
      // print('clicou em cadastrar');
      // print('Seu nome é ${_nameController.text.toString()}');
      // print('Seu peso é ${_weightController.text.toString()}');
      // print('Sua altura é ${_heightController.text.toString()}');

      //converter.....
      //<2
      // double weight = double.parse(_weightController.text);
      // double height = double.parse(_heightController.text);

      //>2
      // double weight = double.tryParse(_weightController.text);
      // double height = double.tryParse(_heightController.text);

      //outro exemplo
      // int x = int.parse(_heightController.text);

      final person = Person(
          _nameController.text,
          double.tryParse(_weightController.text),
          double.tryParse(_heightController.text)
      );

      print('Resultado: ${person.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Resultado:\n${person.toString()}'),)
      );

      //para atualizar na tela...
      setState(() {
        _imc = person.calculateIMC();
      });

    } else {
      print('Digite os campos corretamente :-/');

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Digite os campos corretamente', ),)
      );
    }
  }

  //Método com arrow function
  _resetFields() => _formKey.currentState.reset();
}
