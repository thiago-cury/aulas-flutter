import 'package:exemplo_giphy/views/giphy_page_detail.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

import '../constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {

  final String title;
  Home(this.title);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _search;
  int _offset = 0;

  @override
  void initState() {
    super.initState();

    _fetchGifs().then((map){ //executa esse código e passa direto...
      print(map);
    });

  }

  _rowTextField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Pesquise aqui...",
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.black, fontSize: 18.0),
        textAlign: TextAlign.center,
        onSubmitted: (text) {
          setState(() {
            _offset = 0; //limpar o offset para a nova buscar iniciar zerada.
            _search = text;
          });
        },
      ),
    );
  }

  _rowProgress() {
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 5.0,
      ),
    );
  }

  _rowError() {
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      child: Text("Erro :-("),
    );
  }

  _rowGridView(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0
        ),
        itemCount: _getCount(snapshot.data["data"]),
        itemBuilder: (context, index) {
          if(_search == null || index < snapshot.data["data"].length) {
            return GestureDetector(
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: snapshot.data["data"][index]["images"]["fixed_height"]["url"],
                  height: 300,
                  fit: BoxFit.cover,),
              onTap: () {
                print("clicou");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      GiphyPageDetail(snapshot.data["data"][index])
                    )
                );
              },
              onLongPress: () {
                Share.share(snapshot.data["data"][index]["images"]["fixed_height"]["url"]);
              },
            );
          } else {
            return TextButton(
              child: Text("Carregar mais..."),
              onPressed: () {
                setState(() {
                  _offset += 19;
                });
              },
            );
          }
        }
    );
  }

  int _getCount(List data) {
    if(_search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  _rowFutureBuilder(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
          future: _fetchGifs(),
          builder: (context, snapshot) {
            print('estado atual: ${snapshot.connectionState}');
            //waiting, none, done, active, ....
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return _rowProgress();
              case ConnectionState.done:
              case ConnectionState.active:
              default:
                if(snapshot.hasError) {
                  return _rowError();
                } else if(snapshot.hasData){
                  return _rowGridView(context, snapshot);
                }
            }
          },
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}'),),
      body: Column(
        children: [
          _rowTextField(),
          _rowFutureBuilder(context)
        ],
      ),
    );
  }

  Future<Map> _fetchGifs() async {
    var urlSearch = Uri.https(
        Constant.BASE_URL,
        Constant.BASE_VERSION+Constant.BASE_GIFS+Constant.BASE_SEARCH_ENDPOINT,
        {
          'api_key' : '${Constant.API_TOKEN}',
          'q' : '$_search',
          'limit' : '19',
          'offset' : '$_offset',
          'rating' : 'G',
          'lang' : 'en'
        }
    );

    var urlTrending = Uri.https(
        Constant.BASE_URL,
        Constant.BASE_VERSION+Constant.BASE_GIFS+Constant.BASE_TRENDING_ENDPOINT,
        {'api_key' : '${Constant.API_TOKEN}'});

    var response;
    if(_search == null) {
      response = await http.Client().get(urlTrending);
    } else {
      response = await http.Client().get(urlSearch);
    }

    return json.decode(response.body);
  }
}
