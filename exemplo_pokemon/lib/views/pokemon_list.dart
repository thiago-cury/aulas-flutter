import 'package:exemplo_pokemon/model/model.dart';
import 'package:exemplo_pokemon/service/service.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  List<Pokemon> _pokemonsList = [];
  bool _progress = false;

  _rowIcon() {
    return Icon(Icons.android, size: 100);
  }

  _rowProgress() {
    return _progress ? CircularProgressIndicator() : Text(''); //aquele cheiro... gambica....
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () => _search(context),
      label: Text('Buscar'),
      icon: Icon(Icons.add)
    );
  }

  _title(int index) {
    return Text('${_pokemonsList[index].name}');
  }

  _subtitle(int index) {
    return Text('${_pokemonsList[index].url}');
  }

  _rowPokemon() {
    if(_pokemonsList.isEmpty) {
      return Text('sem pokemons...');
    }
    return ListView.builder(
      itemCount: _pokemonsList.length,
      itemBuilder: (context, index) {
        print('Quantidade de pokemon: ${_pokemonsList.length}');
        return ListTile(
          title: _title(index),
          subtitle: _subtitle(index),
          leading: Image.network('${Constant.BASE_IMAGE_URL}${index+1}.png'),
          onTap: () {
            print('Clicou no: ${_pokemonsList[index].name}');
            print('${_pokemonsList[index].toString()}');
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _rowIcon(),
        Container(
          height: 400,
          child: _rowPokemon(),
        ),
        _rowProgress(),
        _rowButton(context),
      ],
    );
  }

  _search(BuildContext context) async {
    var pokemonService = PokemonService();

    setState(() {
      _progress = true;
    });

    _pokemonsList = await pokemonService.fetchPokemons();

    //pode retirar depois....
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${_pokemonsList.toString()}'))
    );

    //para atualizar a tela....
    setState(() {
      print("atualizando tela");
      _progress = false;
    });
  }

}
