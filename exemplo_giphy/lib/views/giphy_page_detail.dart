
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class GiphyPageDetail extends StatelessWidget {

  Map _gifData = null;

  GiphyPageDetail(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Giphy Detail = ${_gifData["title"]}"),
      backgroundColor: Colors.blueAccent,
      actions: [
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            Share.share(_gifData["images"]["fixed_height"]["url"]);
          },
        )
      ],
      ),
      body: Center(
        child: Image.network(_gifData["images"]["fixed_height"]["url"]),
      ),
    );
  }
}


