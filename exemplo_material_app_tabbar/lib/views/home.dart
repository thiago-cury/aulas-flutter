import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Exemplo MaterialAppTabBar'),
            bottom: TabBar(
              tabs: [
                // Text('Guia 1'),
                // Text('Guia 2'),
                Tab(icon: Icon(Icons.home),),
                Tab(icon: Icon(Icons.android),),
                Tab(icon: Icon(Icons.list),),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              const Center(
                child: const Text(
                'Primeira guia',
                style: TextStyle(
                    backgroundColor: Colors.orange,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold),
                ),
              ),
              const Center(
                child: const Text(
                  'Segunda guia',
                  style: TextStyle(
                      backgroundColor: Colors.orange,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Center(
                child: Icon(Icons.people, size: 100.0),
              ),
            ],
          ),
      )
    );

    // return Scaffold(
    //   appBar: AppBar(title: Text('Exemplo MaterialAppTabBar'),),
    //   body: Column(
    //     children: [
    //       // ignore: prefer_const_literals_to_create_immutables
    //       const Text(
    //         'a',
    //         style: TextStyle(
    //             backgroundColor: Colors.orange,
    //             fontSize: 50.0,
    //             fontWeight: FontWeight.bold),
    //         ),
    //       const Text('b'),
    //       const Text('c'),
    //       TextButton(
    //         onPressed: () {
    //           print('clicou');
    //           _showSnackBar(message: 'clicou no botão', context: context);
    //         },
    //         onLongPress: () {
    //           print('clicou e segurou');
    //           _showSnackBar(message: 'clicou e segurou no botão', context: context, type: true);
    //         },
    //         child: Text('Enviar mensagem'),
    //       )
    //     ],
    //   ), //aninhamento
    // );
  }

  _showSnackBar({required String message, required BuildContext context, bool type = false}) {
    ScaffoldMessenger
        .of(context)
        .showSnackBar(
          SnackBar(
              backgroundColor: type ? Colors.red : Colors.green,
              content: Text(message)
          )
    );
  }

}
