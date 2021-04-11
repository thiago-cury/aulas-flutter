
import '../constant.dart';

class Pokemon {

  String name;
  String url;

  Pokemon(this.name, this.url);

  Pokemon.fromJson(Map<dynamic, dynamic> map) {
    this.name = map['name'] ?? '';
    this.url = map['url'] ?? '';
  }

  @override
  String toString() {
    return '\nName: $name\nurl: $url';
  }

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
    }
  ]
}
*/