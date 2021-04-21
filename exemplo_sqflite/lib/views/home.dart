import 'package:exemplo_sqflite/db/db.dart';
import 'package:exemplo_sqflite/model/contact.dart';
import 'package:exemplo_sqflite/views/views.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ContactHelper _helper = ContactHelper();

  List<Contact> _contacts = [];
  int _size;

  @override
  void initState() {
    super.initState();

    // Contact contact = Contact("Thiago", "thiagocury@gmail.com", "51982092209");

    //Salvando...
    // _helper.save(contact);

    //Buscando todos os contatos cadastrados...
    _helper.fetchAll().then((list) {
      print(list);
      setState(() {
        _contacts = list;
      });
    });

    //Retornando quantos contatos temos no banco de dados....
    // _helper.getSize().then((value) {
    //   print(value);
    //   setState(() {
    //     _size = value;
    //   });
    // });

  }

  _save(BuildContext context) async {
   print("clicou");
   //register_contact....
   final contact = await Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => RegisterContact(Contact('','',''))
                         )
                     );
   if(contact != null)
     await _helper.save(contact);
   setState(() async {
     _contacts = await _helper.fetchAll();
   });
  }

  _contactCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print('clicou card');
        print("contato escolhido: ${_contacts[index].toString()}");
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_contacts[index].name ?? "",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(_contacts[index].email ?? "",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(_contacts[index].phone ?? "",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _list(BuildContext context) {
    print('tamanho: ${_contacts.length}');
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: _contacts.length,
      itemBuilder: (context, index) {
        return _contactCard(context, index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter - SQFLite'),),
      body: Column(
        children: [
          // Text("Teste com valores fixos"),
          // Text("Quantidade de contatos: $_size"),
          // Text("${_contacts.toString()}"),
          Expanded(child: _list(context),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _save(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
