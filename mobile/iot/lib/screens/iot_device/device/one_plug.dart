

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/ionicons.dart';

class OnePlugDevice extends StatefulWidget {
  @override
  _OnePlugDevice createState() => _OnePlugDevice();
}

class _OnePlugDevice extends State<OnePlugDevice> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Stack(
              children: <Widget>[
                Container(child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: FlatButton(
                        onPressed: null,
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset('assets/iot/on.jpg')))
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}