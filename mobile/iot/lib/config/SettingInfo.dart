import 'package:iot/models/UserInfoData.dart';
import 'package:iot/config/http_config.dart';
import 'package:iot/config/mqtt_config.dart';
import 'package:iot/network/mqtt_client_network.dart';

class SettingInfo {
  static final SettingInfo _instance = SettingInfo._internal();
  UserInfoData userInfo;
  HttpConfig httpConfig;
  MQTTConfig mqttConfig;
  MQTTClientNetwork mMQTTClientNetwork;
  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory SettingInfo() {
    return _instance;
  }

  UserInfoData GetUserInfor(){
    if(userInfo==null) userInfo=new UserInfoData();
    return userInfo;
  }

  HttpConfig GetHttpConfig(){
    if(httpConfig==null) httpConfig=new HttpConfig();
    return httpConfig;
  }

  MQTTConfig GetMqttConfig(){
    if(mqttConfig==null) mqttConfig=new MQTTConfig();
    return mqttConfig;
  }

  MQTTClientNetwork GetMQTTClientNetwork(){
    if(mMQTTClientNetwork==null) mMQTTClientNetwork=new MQTTClientNetwork();
    return mMQTTClientNetwork;
  }

  void setEmailAndtocken(String email,String tocken){
    userInfo.email=email;

  }
  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  SettingInfo._internal() {
    // initialization logic 
  }


}