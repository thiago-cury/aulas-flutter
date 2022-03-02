import 'package:exemplo_api_game_of_thrones/model/model.dart';
import 'package:exemplo_api_game_of_thrones/service/service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Castle?>? _listCastles;
  bool _progress = false;

  _rowProgress() {
    return _progress ? const CircularProgressIndicator() : Container();
  }

  _rowListCastles() { //List.....
    if(_listCastles == null) {
      return const Text('Sem castelos');
    }
    return ListView.builder(
      itemCount: _listCastles!.length,
      itemBuilder: (context, index) {
        print('${_listCastles!.elementAt(index).toString()}');

        return ListTile(
          title: Text('${_listCastles!.elementAt(index)!.name}'),
          subtitle: Text('${_listCastles!.elementAt(index)!.location}'),
          leading: const CircleAvatar(backgroundColor: Colors.blue,),
          trailing: const Icon(Icons.android),
          onTap: () {
            print('clicou no ${_listCastles!.elementAt(index).toString()}');
          }
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: _rowProgress()
          ),
          Expanded(
            flex: 5,
            child: _rowListCastles(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _fetchCastles(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  _fetchCastles(BuildContext context) async {
    //service... got_service...
    final gotService = GotService();

    setState(() {
      _progress = true;
    });

    _listCastles = await gotService.fetchCastles();

    setState(() {
      print('atualizando a tela');
      _progress = false;
    });

    // _showSnackBar(context, _listCastles.toString()); //só para teste....

  }

  _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$message'))
    );
  }
}