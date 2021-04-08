import 'package:audioplayers/audio_cache.dart';
import 'package:exemplo_xilofone/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {

  final String title;

  Home(this.title);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget _expandedNote(Color color, String note, String descriptionNote) {
    return Expanded(
        child: Container(
          width: double.infinity,
          color: color,
          child: TextButton(
            onPressed: () {
              _playNote(note);
              _sendFlutterToast(descriptionNote);
            },
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _expandedNote(Colors.pink, Constant.DO, "Dó"),
          _expandedNote(Colors.blue, Constant.RE, "Ré"),
          _expandedNote(Colors.green, Constant.MI, "Mi"),
          _expandedNote(Colors.purple, Constant.FA, "Fá"),
          _expandedNote(Colors.pinkAccent, Constant.SOL, "Sol"),
          _expandedNote(Colors.yellow, Constant.LA, "Lá"),
          _expandedNote(Colors.orange, Constant.SI, "Si"),
          _expandedNote(Colors.red, Constant.DO_OITAVA, "Dó"),
          _expandedNote(Colors.black, Constant.TEST_SNOOPDOGG, "Snoop"),
          _expandedNote(Colors.grey[600], Constant.TEST_PARA, "Para"),
          _expandedNote(Colors.grey[500], Constant.TEST_MY_MUSIC, "Mymusic"),
        ],
      ),
    );
  }

  _playNote(String note) {
    AudioCache audio = AudioCache();
    audio.play(note);
  }

  _sendFlutterToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 20.0
    );
  }

}
