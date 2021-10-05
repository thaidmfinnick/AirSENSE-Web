import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/ionicons.dart';
import 'layout/bottom_navigation_iot.dart';
import 'device/one_plug.dart';
import 'device/control_rc_model.dart';

class OnOffDeviceScreen extends StatefulWidget {
  @override
  _OnOffDeviceScreen createState() => _OnOffDeviceScreen();
}

class _OnOffDeviceScreen extends State<OnOffDeviceScreen> {

  bool value = false;
  Color color = Colors.grey;

  onUpdate() {
    setState(() {
      value = !value;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Device",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: IconButton(
          icon:
          Icon(Ionicons.getIconData("ios-arrow-back"), color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          FlatButton(
          onPressed: null,
          padding: EdgeInsets.all(0.0),
          child: Image.asset('assets/iot/setting.png',width: 25)
          ),
        ],
      ),
      body: OnePlugDevice(),
      bottomNavigationBar:BottomNavigationIOT()
    );
  }


/*
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
            child: new ListView(
              children: <Widget>[
                new DrawerHeader(
                  child: new Text("DRAWER HEADER.."),
                  decoration: new BoxDecoration(color: Colors.orange),
                ),
                new ListTile(
                  title: new Text("Room 1"),
                  onTap: () {},
                ),
                new ListTile(
                  title: new Text("Room 2"),
                  onTap: () {},
                ),
              ],
            )),
        body: SafeArea(
          child: StreamBuilder(

          ),//stream: null,// dbRef.child("Data").onValue),
        ),
      );
  }
8
  Future<void> writeData() async {
    dbRef.child("LightState").set({"switch": !value});
  }

  Future<void> readData() async {
    dbRef.child("Data").once().then((DataSnapshot snapshot) {
      print(snapshot.value);
    });
  }*/
}