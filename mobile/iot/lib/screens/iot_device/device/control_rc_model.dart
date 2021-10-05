

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/ionicons.dart';
import 'package:iot/config/SettingInfo.dart';

class ControlRCModel extends StatefulWidget {
  @override
  _ControlRCModel createState() => _ControlRCModel();
}

class _ControlRCModel extends State<ControlRCModel> {
  Color textColor = Colors.blue;
  void _incrementExit(PointerEvent details) {
    setState(() {
      textColor = Colors.blue;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      textColor = Colors.red;
    });
  }

  void actionClick(String name,String type){
    if(type=="left_menu"){
      switch (name){
        case "left":{
          SettingInfo().GetMQTTClientNetwork().pushblishData('{"control":4,"value":1}');
          break;
        }
        case "right":{
          SettingInfo().GetMQTTClientNetwork().pushblishData('{"control":4,"value":2}');
          break;
        }
        case "bottom":{
          SettingInfo().GetMQTTClientNetwork().pushblishData('{"control":4,"value":3}');
          break;
        }
        case "top":{
          SettingInfo().GetMQTTClientNetwork().pushblishData('{"control":4,"value":4}');
          break;
        }
        case "center":{
          SettingInfo().GetMQTTClientNetwork().pushblishData('{"control":4,"value":5}');
          break;
        }
        default: break;
      }
    }
    else if(type=="right_menu"){
      switch (name){
        case "left":{
          SettingInfo().GetMQTTClientNetwork().pushblishData('{"control":5,"value":1}');
          break;
        }
        case "right":{
          SettingInfo().GetMQTTClientNetwork().pushblishData('{"control":5,"value":2}');
          break;
        }
        case "bottom":{
          SettingInfo().GetMQTTClientNetwork().pushblishData('{"control":5,"value":3}');
          break;
        }
        case "top":{
          SettingInfo().GetMQTTClientNetwork().pushblishData('{"control":5,"value":4}');
          break;
        }
        case "center":{
          SettingInfo().GetMQTTClientNetwork().pushblishData('{"control":5,"value":5}');
          break;
        }
        default: break;
      }
    }
  }

  void onReciveMessageData(String data){

  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if(SettingInfo().GetMQTTClientNetwork().isConnect){
      SettingInfo().GetMQTTClientNetwork().connect();
    }


    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Stack(
              children: <Widget>[
                GridView.count(
                  primary: false,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  crossAxisCount: 4,
                  children: <Widget>[
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: ()=>actionClick("left","left_menu"),
                            color: textColor,
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/iot/top.png')))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: ()=>actionClick("bottom","left_menu"),
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/iot/left1.png')))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: ()=>actionClick("center","left_menu"),
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/iot/center1.png')))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: ()=>actionClick("top","left_menu"),
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/iot/right.png')))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: ()=>actionClick("right","left_menu"),
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/iot/bottom.png')))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              children: <Widget>[
                GridView.count(
                  primary: false,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  crossAxisCount: 4,
                  children: <Widget>[
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: ()=>actionClick("left","right_menu"),
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/iot/top.png')))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: ()=>actionClick("bottom","right_menu"),
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/iot/left1.png')))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: ()=>actionClick("center","right_menu"),
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/iot/center1.png')))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: ()=>actionClick("top","right_menu"),
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/iot/right.png')))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: ()=>actionClick("right","right_menu"),
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/iot/bottom.png')))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                    Container(child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: const Text(''))
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}