import 'dart:io';
import 'package:exemplo_drawer/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant.dart';

class MenuDrawer extends StatelessWidget {

  Widget _createHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Theme.of(context).primaryColor
                ],
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight
            )
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 12.0,
                left: 16.0,
                child: Text("Thiago Cury - thiagocury@gmail.com",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold ),),
              ),
              Positioned(
                  top: 45.0,
                  left: 16.0,
                  child: Icon(Icons.person, size: 100,)
              ),
            ]
        )
    );
  }

  Widget _createDrawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(context),
          SizedBox(height: 10.0,),
          _createDrawerItem(
              icon: Icons.home,
              text: Constant.menuHome,
              onTap: () {
                Navigator.of(context).pop();
              }
          ),
          SizedBox(height: 10.0,),
          Divider(),
          _createDrawerItem(
              icon: Icons.list,
              text: Constant.menuScreen1,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Screen1()));
              }
          ),
          _createDrawerItem(
              icon: Icons.list,
              text: Constant.menuScreen2,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Screen2()));
              }
          ),
          Divider(),
          _createDrawerItem(
              icon: Icons.info,
              text: Constant.menuAbout,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => About()));
              }
          ),
          Divider(),
          _createDrawerItem(
              icon: Icons.directions_run_outlined,
              text: Constant.menuExit,
              onTap: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              }
          ),
        ],
      ),
    );
  }

}