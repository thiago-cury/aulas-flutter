import 'package:exemplo_imc_bloc_conceitual/bloc/bloc.dart';
import 'package:flutter/material.dart';

class AndroidHome extends StatefulWidget {

  final String title;

  AndroidHome(this.title);

  @override
  _AndroidHomeState createState() => _AndroidHomeState();
}

class _AndroidHomeState extends State<AndroidHome> {

  var imcBloc = IMCBloc();

  _rowHeight() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Altura (cm)",
        ),
        controller: imcBloc.heightController,
        keyboardType: TextInputType.number,
      ),
    );
  }

  _rowWeight() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Peso (Kg)",
        ),
        controller: imcBloc.weightController,
        keyboardType: TextInputType.number,
      ),
    );
  }

  _rowResult() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: StreamBuilder<String>(
        stream: imcBloc.myStream,
        initialData: "",
        builder: (context, snapshot) {
          //aqui retorna o resultado
          if(snapshot.hasError) {
            return Text('Deu erro!');
          } else if(snapshot.hasData) {
            return Text('Resultado: ${snapshot.data}');
          }
          return Text('...');
        }
      ),
    );
  }

  _rowCalculateButton() {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: TextButton(
          child: Text('Calcular'),
          onPressed: () => imcBloc.calculate(),
        ),
    );
  }

  _rowResetButton() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextButton(
        child: Text('Limpar campos'),
        onPressed: () => imcBloc.resetFields(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}'),),
      body: ListView(
        children: [
          _rowHeight(),
          _rowWeight(),
          _rowResult(),
          _rowCalculateButton(),
          _rowResetButton(),
        ],
      ),
    );
  }
}
