import 'package:exemplo_pokemon/model/model.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class PokemonDetail extends StatefulWidget {

  final Pokemon? pokemon;
  final int? id;

  const PokemonDetail({Key? key, this.pokemon, this.id}) : super(key: key);

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {

  @override
  void initState() {
    super.initState();
    //continuação....
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Detalhe do ${widget.pokemon!.name}'),),
      body: Column(
        children: [
          Image.network('${Constant.baseUrlImage}${widget.id}.png'),
          Text('Detalhe do pokemon ${widget.pokemon!.name}'),
          Text('URL para ver mais infos ${widget.pokemon!.url}')
        ],
      )
    );

  }
}
