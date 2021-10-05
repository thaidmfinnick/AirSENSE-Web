

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/ionicons.dart';

class TopNavigationIOT extends StatefulWidget {
  @override
  _TopNavigationIOT createState() => _TopNavigationIOT();
}

class _TopNavigationIOT extends State<TopNavigationIOT> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            child: Image.asset('assets/iot/setting.png')
        ),
      ],
    );
  }

}