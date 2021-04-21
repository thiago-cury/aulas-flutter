import 'package:exemplo_cep/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _cepController = TextEditingController();

  _form(CepBloc cepBloc, BuildContext context) {
    return Column(
      children: [
        Text('Procure o CEP'),
        TextFormField(
          controller: _cepController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            enabledBorder: OutlineInputBorder(),
            hintText: "CEP",
            hintStyle: TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.blue,
                style: BorderStyle.solid
              )
            )
          ),
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
            onPressed: () {
              print("clicou: ${_cepController.text}");
              cepBloc.add(FetchCepEvent(_cepController.text));
            },
            child: Text('Buscar CEP')
        )
      ],
    );
  }

  _cepIsLoaded(CepBloc cepBloc, CepState state, BuildContext context) {
    return Column(
      children: [
        Text('CEP encontrado: ${state.props[0].toString()}'),
        TextButton(
          onPressed: () {
            print('clicou buscar novamente');
            cepBloc.add(ResetCepEvent());
          },
          child: Text('Buscar novamente'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final cepBloc = BlocProvider.of<CepBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CepBloc, CepState>(
          builder: (context, state) {

            print('state currently: $state');

            if(state is CepIsNotSearchedState) {
              return _form(cepBloc, context);
            } else if(state is CepIsLoadingState) {
              return CircularProgressIndicator();
            } else if(state is CepIsLoadedState) {
              return _cepIsLoaded(cepBloc, state, context);
            } else if(state is CepIsNotLoadedState) {
              return Text('Erro : ${state.getMessage.toString()}');
            }
            return Text('Erro!');
          }
        )
      ],
    );
  }
}

//setState(() {});
