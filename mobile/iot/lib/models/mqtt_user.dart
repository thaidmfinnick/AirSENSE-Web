
import 'package:iot/models/UserInfoData.dart';
import 'package:iot/models/model.dart';
import 'package:iot/screens/eshop/userinfo.dart';
import 'package:json_annotation/json_annotation.dart';


class MqttUser extends Model {
  int mqtt_user_id;
  int user_id;
  String content;
  String mqtt_pub;
  String mqtt_sub;
  String mqtt_user;
  String mqtt_pass;
  String mqtt_id;

  @override
  Map<String, dynamic> toMap() {
    return {
      'mqtt_user_id': mqtt_user_id,
      'user_id': user_id,
      'content': content,
      'mqtt_pub': mqtt_pub,
      'mqtt_sub': mqtt_sub,
      'mqtt_user': mqtt_user,
      'mqtt_pass': mqtt_pass,
      'mqtt_id': mqtt_id,
    };
  }
  @override
  void InformValueData(Map<String, dynamic> info){
    this.mqtt_user_id=  getValueContain(info,"mqtt_user_id",this.mqtt_user_id,false);
    this.user_id=  getValueContain(info,"user_id",this.user_id,false);
    this.content=  getValueContain(info,"content",this.content,true);
    this.mqtt_pub=  getValueContain(info,"mqtt_pub",this.mqtt_pub,true);
    this.mqtt_sub=  getValueContain(info,"mqtt_sub",this.mqtt_sub,true);
    this.mqtt_user=  getValueContain(info,"mqtt_user",this.mqtt_user,true);
    this.mqtt_pass=  getValueContain(info,"mqtt_user_id",this.mqtt_pass,false);
    this.mqtt_id=  getValueContain(info,"mqtt_user_id",this.mqtt_id,false);
  }

  Map<String, String> GetInfoToUser(UserInfoData infoUser)
  {
    Map<String, String>  info =new Map<String,String>();
    info['customer_id']='0';
    info['username']=infoUser.username;
    info['email']=infoUser.email;
    info['password']=infoUser.password;
    info['phone']='0';
    info['avatar']=infoUser.icon;
    info['fullname']=infoUser.username;
    info['permission_id']='0';
    info['address']='authen';
    info['note']='Register by mobile';
    info['table']='customer';
    return info;
  }


}

