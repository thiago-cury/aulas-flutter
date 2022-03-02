import 'package:flutter/cupertino.dart';
import 'package:imc_block/bloc/imcbloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var bloc = new ImcBloc();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cálculo de IMC"),
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoTextField(
              placeholder: "Altura (cm)",
              controller: bloc.heightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoTextField(
              placeholder: "Peso (kg)",
              controller: bloc.weightCtrl,
              keyboardType: TextInputType.number,
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
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoButton.filled(
              child: Text(
                "Calcular",
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
