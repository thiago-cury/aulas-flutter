import 'dart:async';
import 'dart:convert';
import 'package:exemplo_pokemon/model/model.dart';
import '../constant.dart';
import 'package:http/http.dart' as http;

abstract class AbstractPokemonService {

  Future<List<Pokemon>?>? fetchPokemon();
  Future<List<Pokemon>?>? fetchNextPreviousPokemon({required int offset});

}

/*
{
  "count": 1118,
  "next": "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20",
  "previous": null,
  "results": [
    {
      "name": "bulbasaur",
      "url": "https://pokeapi.co/api/v2/pokemon/1/"
    },
    {
      "name": "ivysaur",
      "url": "https://pokeapi.co/api/v2/pokemon/2/"
    },
    ...........
  ]
}
*/

class PokemonService extends AbstractPokemonService {

  Future<List<Pokemon>?>? fetchNextPreviousPokemon({required int offset}) async {

    //? -> query
    //offset = 20
    // &
    // limit = 20
    //"next": "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20",
    final url = Uri.https(
        '${Constant.baseUrl}',
        '${Constant.baseUrlVersion}${Constant.endPoint}',
        {'offset':'${offset}', 'limit':'{20}'}
        );
    final response = await http.Client().get(url);
    if(response.statusCode != 200) {
      print('deu erro na paginação');
      return [];
    }
    print('response -> ${response.body.toString()}');

    return parsedJson(response.body);
  }

  @override
  Future<List<Pokemon>?>? fetchPokemon() async {

    final url = Uri.https('${Constant.baseUrl}', '${Constant.baseUrlVersion}${Constant.endPoint}');

    final response = await http.Client().get(url);

    if(response.statusCode != 200) {
      return [];
    }

    print('response -> ${response.body.toString()}');

    return parsedJson(response.body);

  }

  List<Pokemon> parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    List<dynamic> pokemons = jsonDecoded['results'];
    return pokemons.map((element) => Pokemon.fromJson(element)).toList();
  }

}