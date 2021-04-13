import 'package:exemplo_imc_bloc_conceitual/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class IOSHome extends StatefulWidget {

  final String title;

  IOSHome(this.title);

  @override
  _IOSHomeState createState() => _IOSHomeState();
}

class _IOSHomeState extends State<IOSHome> {

  var imcBloc = IMCBloc();

  _rowHeight() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: CupertinoTextField(
        placeholder: "Altura (cm)",
        controller: imcBloc.heightController,
        keyboardType: TextInputType.number,
      ),
    );
  }

  _rowWeight() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: CupertinoTextField(
        placeholder: "Peso (Kg)",
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
      child: CupertinoButton.filled(
        child: Text('Calcular'),
        onPressed: () => imcBloc.calculate(),
      )
    );
  }

  _rowResetButton() {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: CupertinoButton.filled(
          child: Text('Limpar campos'),
          onPressed: () => imcBloc.resetFields(),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('${widget.title}'),
        ),
        child: ListView(
          children: [
            _rowHeight(),
            _rowWeight(),
            _rowResult(),
            _rowCalculateButton(),
            _rowResetButton()
          ],
        ),
    );
  }
}
