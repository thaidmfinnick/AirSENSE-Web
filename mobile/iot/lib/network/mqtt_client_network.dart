
import 'dart:async';
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:iot/config/SettingInfo.dart';
import 'package:flutter/material.dart';

typedef CallbackDataSubcribe = void Function(String data);

class MQTTClientNetwork {

  CallbackDataSubcribe onCallbackDataSubcribe = null;
  MqttServerClient client;
  bool isConnect;
  Future<bool> connect() async {
    // Set the port'client.keepAlivePeriod = 20;
    this. client = MqttServerClient(SettingInfo().GetMqttConfig().mqttLink, SettingInfo().GetMqttConfig().clientID);
    this.client.port = SettingInfo().GetMqttConfig().portMqtt;
    this.client.keepAlivePeriod = 20;
    this.client.onDisconnected = onDisconnected;
    this.client.onSubscribed = onSubscribed;
    final connMess = MqttConnectMessage()
        .withClientIdentifier('Mqtt_MyClientUniqueIdQ1')
        .withWillTopic('willtopic') // If you set this you must set a will message
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    print('EXAMPLE::Mosquitto client connecting....');
    this.client.connectionMessage = connMess;
    try {
      await this.client.connect(SettingInfo().GetMqttConfig().userName, SettingInfo().GetMqttConfig().authenPassword);
      if (this.client.connectionStatus.state == MqttConnectionState.connected) {
        print('iotcore client connected');
        this.client.subscribe(SettingInfo().GetMqttConfig().userSubcribe, MqttQos.atLeastOnce);
        isConnect=true;
      } else {
        print(
            'ERROR iotcore client connection failed - disconnecting, state is ${this.client.connectionStatus.state}');
        this.client.disconnect();
        isConnect=false;
      }
    } on Exception catch (e) {
      print('EXAMPLE::client exception - $e');
      this.client.disconnect();
      isConnect=false;
      return false;
    }
    return true;
  }


  bool setSubscribed(String topic){
    try {
        this.client.subscribe(SettingInfo().GetMqttConfig().userSubcribe, MqttQos.atLeastOnce);
    } on Exception catch (e) {
      return false;
    }
    return true;
  }

  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
    if(this.onCallbackDataSubcribe!=null){
      this.onCallbackDataSubcribe(topic);
    }
  }

  void setCallBack(CallbackDataSubcribe callbackDataSubcribe){
    this.onCallbackDataSubcribe=callbackDataSubcribe;
  }
  // callback function

  /// The unsolicited disconnect callback
  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    isConnect=false;
  }
  void disconnected() {
    this.client.disconnect();
  }

  void pushblishData(String dataInput){
    final builder1 = MqttClientPayloadBuilder();
    builder1.addString(dataInput);
    print('EXAMPLE:: <<<< PUBLISH 1 >>>>');
    this.client.publishMessage(SettingInfo().GetMqttConfig().userPushbish, MqttQos.atLeastOnce, builder1.payload);
  }

}