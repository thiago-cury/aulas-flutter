import 'package:exemplo_pokemon/model/model.dart';
import 'package:exemplo_pokemon/service/service.dart';
import 'package:exemplo_pokemon/views/views.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Pokemon?>? _pokemonsList;
  bool _progress = false;

  int _count = 0;
  int _page = 1;

  _rowIcon() {
    return Image.network('https://cdn.discordapp.com/attachments/577900277357871106/877569042477629480/snorlax.png');
  }

  _rowProgress() {
    return _progress ? const CircularProgressIndicator() : Container();
  }

  _title(Pokemon? pokemon) {
    return Text(pokemon!.name.toString());
  }

  _subtitle(Pokemon? pokemon) {
    return Text(pokemon!.url.toString());
  }

  _rowListPokemon() {
    if(_pokemonsList == null) {
      return const Text('Sem pokemon :-/', style: TextStyle(fontSize: 20.0));
    }
    // return ListView.builder(
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      itemCount: _pokemonsList!.length,
      itemBuilder: (context, index) {

        print('Qtd de pokemon: ${_pokemonsList!.length}');
        // final pokemon = _pokemonsList![index];
        final pokemon = _pokemonsList!.elementAt(index);

        return Card(
          color: Colors.green,
          child: ListTile(
              title: _title(pokemon),
              subtitle: _subtitle(pokemon),
              leading: CircleAvatar(
                backgroundColor: Colors.white70,
                backgroundImage: NetworkImage('${Constant.baseUrlImage}${index+1}.png'),
              ),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                print('Clicou no ${pokemon!.name}');
                //abrir a tela de detalhe
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PokemonDetail(pokemon: pokemon, id: index+1,)
                    )
                );
              }
          ),
        );
      }
    );
  }

  _rowControls(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _count > 0 ?
          TextButton.icon(
              onPressed: () => _previous(context),
              label: Text('Anterior'),
              icon: Icon(Icons.arrow_back_outlined)
          ) : Container(),
          TextButton.icon(
              onPressed: () => _next(context),
              label: Text('Próximo'),
              icon: Icon(Icons.arrow_forward_outlined)
          ),
        ]
    );
  }

  _rowPage() {
    return Text('Página -> ${_page.toString()}', style: const TextStyle(fontSize: 20.0));
  }

  _body(BuildContext context) {
    return Column(
      children: [
        _rowIcon(),
        _rowPage(),
        // ignore: sized_box_for_whitespace
        Container(
          height: 400,
          child: _rowListPokemon(),
        ),
        _rowControls(context),
        _rowProgress()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _fetchPokemon(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  _fetchPokemon(BuildContext context) async {

    //resetar a paginação
    _count = 0;
    _page = 1;

    final pokemonService = PokemonService();

    setState(() {
      _progress = true;
    });

    _sendSnackBar(context, 'Aguarde, baixando pokemons');

    _pokemonsList = await pokemonService.fetchPokemon();

    print('lista mapeada: ${_pokemonsList.toString()}');

    setState(() {
      _progress = false;
    });

  }

  _next(BuildContext context) async {
    _count = _count + 20;
    _page++; //_page = _page + 1;

    setState(() {
      _progress = true;
    });

    final pokemonService = PokemonService();
    _pokemonsList = await pokemonService.fetchNextPreviousPokemon(offset: _count);

    print('lista mapeada: ${_pokemonsList.toString()}');

    setState(() {
      _progress = false;
    });
  }

  _previous(BuildContext context) async {
    _count = _count - 20;
    _page--; //_page = _page - 1;

    setState(() {
      _progress = true;
    });

    final pokemonService = PokemonService();
    _pokemonsList = await pokemonService.fetchNextPreviousPokemon(offset: _count);

    _sendSnackBar(context, 'Aguarde, baixando pokemons');

    _pokemonsList = await pokemonService.fetchPokemon();

    print('lista mapeada: ${_pokemonsList.toString()}');

    setState(() {
      _progress = false;
    });
  }

  _sendSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

}