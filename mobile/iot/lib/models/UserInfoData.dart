import 'package:iot/network/http/HttpRequestData.dart';
import 'package:iot/utils/local_stogate.dart';
import 'package:iot/config/SettingInfo.dart';

import 'Customer.dart';
import 'mqtt_user.dart';

class UserInfoData  extends HttpRequestData{
   String username;
   String password;
   String phone;
   String icon;
   String email;
   String manifest;
   String tockenAcess;

   Customer customer;
   MqttUser mqttUser;

  UserInfoData(
      {this.username,
        this.password,
        this.phone,
        this.icon,
        this.email,
        this.manifest,
        this.tockenAcess});


   Future<bool> checkUserInval() async {
     LocalStogate saveData= new LocalStogate();
     String token=await saveData.getValueString("token");
     if(token!=null){
       Map dataTologin =await getGetDataUserInfo(token);
       if(dataTologin!=null){
         var dataAcess=dataTologin["user"];
         this.email = dataAcess["email"];
         this.username = dataAcess["email"];
         this.phone = dataAcess["phone"];
         return true;
       }
     }
     return false;
   }
   Future<bool> checkUserInvalLogin(Map<String, String> dataLogin) async {
      LocalStogate saveData= new LocalStogate();
      Map dataTologin =await fetchPostDataJsonFromUri("/api/auth/login", dataLogin);
      if(dataTologin!=null){
        if(dataTologin["success"]) {
          var dataAcess=dataTologin["user"];
          this.email = dataAcess["email"];
          this.tockenAcess = dataAcess["token"];
          this.phone = dataAcess["phone"];
          saveData.setValueString("token", SettingInfo().GetUserInfor().tockenAcess);
          return true;
        }
      }
      return false;
   }

   Future<bool> registerToUser(Map<String, String> dataRegister) async {
     LocalStogate saveData= new LocalStogate();
     Map dataTologin =await fetchPostDataJsonFromUri("/api/customer/register", dataRegister);
     if(dataTologin!=null){
       if(dataTologin["success"]) {
         var dataAcess=dataTologin["user"];
         this.email = dataAcess["email"];
         this.tockenAcess = dataAcess["token"];
         this.phone = dataAcess["phone"];
         saveData.setValueString("token", SettingInfo().GetUserInfor().tockenAcess);
         return true;
       }
     }
     return false;
   }

   Future<bool> registerToUser1(Map<String, String> dataRegister) async {
     LocalStogate saveData= new LocalStogate();
     Map dataTologin =await fetchPostDataJsonFromUri("/api/customer/register", dataRegister);
     if(dataTologin!=null){
       if(dataTologin["success"]) {
         var dataAcess=dataTologin["user"];
         this.email = dataAcess["email"];
         this.tockenAcess = dataAcess["token"];
         this.phone = dataAcess["phone"];
         saveData.setValueString("token", SettingInfo().GetUserInfor().tockenAcess);
         return true;
       }
     }
     return false;
   }



   Future<bool> checkUserMqtt() async {
     LocalStogate saveData= new LocalStogate();
     String token=await saveData.getValueString("token");
     Customer customer=new Customer();
     customer.InformValueData(customer.GetInfoToUser(this));
     await customer.saveStogateData(saveData);
     MqttUser data= await customer.requestCustomer();
     await customer.saveStogateData(saveData);
     this.customer=customer;
     this.mqttUser=data;
     SettingInfo().GetMqttConfig().mqttLink="mqtt://maqtt.airsense.vn";
     SettingInfo().GetMqttConfig().portMqtt=1882;
     SettingInfo().GetMqttConfig().userPushbish=this.mqttUser.mqtt_pub;
     SettingInfo().GetMqttConfig().userSubcribe=this.mqttUser.mqtt_sub;
     SettingInfo().GetMqttConfig().userName=this.mqttUser.mqtt_user;
     SettingInfo().GetMqttConfig().authenPassword=this.mqttUser.mqtt_pass;
     SettingInfo().GetMqttConfig().clientID=this.mqttUser.mqtt_id;
      if(data==null) return false;
     return true;
   }


}
