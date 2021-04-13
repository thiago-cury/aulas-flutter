import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Home extends StatefulWidget {

  final String title;

  Home(this.title);

  @override
  _HomeState createState() => _HomeState();
}

enum TtsState { playing, stopped, paused, continued }

class _HomeState extends State<Home> {

  FlutterTts _flutterTts = FlutterTts();
  TtsState _ttsState;
  double _volume = 0.5;

  _rowTextField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Digite o que quiser.... eu vou falar...",
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.black, fontSize: 18.0),
        textAlign: TextAlign.center,
        onSubmitted: (text) => _speak(text),
      ),

    );
  }

  _rowVolume() {
    return Slider(
      value: _volume,
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: "Volume: $_volume",
      onChanged: (newVolume) {
        setState(() {
          _volume = newVolume;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _ttsState = TtsState.stopped;
  }

  @override
  void dispose() {
    super.dispose();
    _flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}'),),
      body: Column(
        children: [
          _rowTextField(),
          _rowVolume(),
          TextButton(
              onPressed: () => _speak('Hi, I\'m Thiago Cury'),
              child: Text('Falar')
          ),
          TextButton(
              onPressed: () => _stop(),
              child: Text('Parar de falar')
          ),
        ],
      ),
    );
  }

  Future _speak(String message) async {
    await _flutterTts.setVolume(_volume);
    var result = await _flutterTts.speak(message);
    if(result == 1) setState(() => _ttsState = TtsState.playing);
  }

  Future _stop() async {
    var result = await _flutterTts.stop();
    if(result == 1) setState(() => _ttsState = TtsState.stopped);
  }

}
