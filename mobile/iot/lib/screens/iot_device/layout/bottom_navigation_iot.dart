

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/ionicons.dart';

class BottomNavigationIOT extends StatefulWidget {
  @override
  _BottomNavigationIOT createState() => _BottomNavigationIOT();
}

class _BottomNavigationIOT extends State<BottomNavigationIOT> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: const Color(0xff00c9d2),
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Image.asset('assets/iot/Control.jpg',width: 40),
            title: new Text('Điều khiển'),
          ),
          BottomNavigationBarItem(
            icon:  Image.asset('assets/iot/alarm.png',width: 40),
            title: new Text('Hẹn giờ'),
          ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/iot/info.jpg',width: 40),
              title: Text('Thông tin')
          ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/iot/share.png',width: 40),
              title: Text('Chia sẻ')
          ),
        ]
    );
  }


/*
  Future<void> writeData() async {
    dbRef.child("LightState").set({"switch": !value});
  }

  Future<void> readData() async {
    dbRef.child("Data").once().then((DataSnapshot snapshot) {
      print(snapshot.value);
    });
  }*/
}