import 'package:flutter/material.dart';
import 'package:imc_block/bloc/imcbloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var bloc = new ImcBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo de IMC"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Altura (cm)",
              ),
              controller: bloc.heightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Peso (kg)",
              ),
              controller: bloc.weightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: StreamBuilder<String>(
                    stream: bloc.myStream,
                    initialData: "",
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Há um erro na Stream');
                      } else {
                        return Text('${snapshot.data}',);
                      }
                    }
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.all(20),
          //   child: Text(
          //     bloc.result,
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(20),
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                "Calcular",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  bloc.calculate();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
