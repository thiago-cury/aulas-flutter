
class Pokemon {

  String? name;
  String? url;

  Pokemon({this.name, this.url});

  Pokemon.fromJson(Map<String, dynamic> map) {
    name = map['name'] ?? null;
    url = map['url'] ?? null;
  }

  @override
  String toString() {
    return 'Pokemon{name: $name, url: $url}';
  }
}

//Dart

/*
[
  {
  "name": "bulbasaur",
  "url": "https://pokeapi.co/api/v2/pokemon/1/",
  },
  {
  "name": "bulbasaur",
  "url": "https://pokeapi.co/api/v2/pokemon/1/",
  }

]
*/