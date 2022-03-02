import 'package:flutter/material.dart';
import 'package:testeflavor/resource/display_strings.dart';

import 'app_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  getDateForDisplay() {
    //DateTime now = DateTime.now();
//    var formatter = DateFormat('EEEE dd MMMM yyyy');
//    return formatter.format(now);
    return "24/06/2020";
  }

  @override
  Widget build(BuildContext context) {

    var config = AppConfig.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flavors Example'),
      ),
      body: _buildBody(config),
    );
  }

  Widget _buildBody(AppConfig config) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        children: [
          Text(config.appName),
//          Text(DATE + getDateForDisplay()),
          new Text('${config.flavorName} app.'),
          new Text('Backend API url is ${config.apiBaseUrl}'),
//          Image.asset('assets/mobfeel-preto.png', width: 50.0, height: 50.0),
//          Image.asset('assets/mobfeel-verde.png', width: 50.0, height: 50.0),
        ],
      ),
    );
  }

}
