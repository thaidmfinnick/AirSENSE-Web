
import 'package:iot/models/UserInfoData.dart';
import 'package:iot/models/model.dart';
import 'package:iot/models/mqtt_user.dart';
import 'package:iot/screens/eshop/userinfo.dart';
import 'package:iot/utils/local_stogate.dart';
import 'package:json_annotation/json_annotation.dart';

class Customer extends Model {
  int customer_id;
  String username;
  String email;
  String password;
  String phone;
  String avatar;
  String fullname;
  int permission_id;
  String address;
  String note;
  Customer();
  @override
  Map<String, dynamic> toMap() {
    return {
      'customer_id': this.customer_id,
      'username': this.username,
      'email': this.email,
      'password': this.password,
      'phone': this.phone,
      'avatar': this.avatar,
      'fullname': this.fullname,
      'permission_id': this.permission_id,
      'address': this.address,
      'note': this.note,
    };
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
    return info;
  }
  @override
  void InformValueData(Map<String, dynamic> info){
    this.customer_id=  getValueContain(info,"customer_id",this.customer_id,false);
    this.username=  getValueContain(info,"username",this.username,true);
    this.email=  getValueContain(info,"email",this.email,true);
    this.password=  getValueContain(info,"password",this.password,true);
    this.phone=  getValueContain(info,"phone",this.phone,true);
    this.avatar=  getValueContain(info,"avatar",this.avatar,true);
    this.fullname=  getValueContain(info,"fullname",this.fullname,true);
    this.permission_id=  getValueContain(info,"permission_id",this.permission_id,false);
    this.address=  getValueContain(info,"address",this.address,true);
    this.note=  getValueContain(info,"note",this.note,true);
  }


  Future<MqttUser> requestCustomer() async {
    Map data =await fetchPostDataJsonFromUri("/api/social/check_email", this.toMap());
    if(data!=null){
      LocalStogate saveData= new LocalStogate();
      this.saveStogateData(saveData);
      MqttUser dataMqtt =new MqttUser();
      dataMqtt.InformValueData(data["result"]);
      dataMqtt.saveStogateData(saveData);
      return dataMqtt;
    }
    return null;
  }

}