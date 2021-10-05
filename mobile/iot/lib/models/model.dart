import 'dart:ui';

import 'package:iot/network/http/HttpRequestData.dart';
import 'package:iot/utils/local_stogate.dart';

class Luck {
  final String image;
  final Color color;
  final String point;

  Luck(this.image, this.color, this.point);

  String get asset => "assets/images/$image.png";
}

abstract  class Model  extends HttpRequestData{

    Map<String, dynamic> toMap();
    void InformValueData(Map<String, dynamic> info);
    Map informData(Map data){
      Map dataCheck= toMap();
      dataCheck.forEach((k,v) =>{
        if(data.containsKey(k))  dataCheck[k]=data[k]
      });
      return dataCheck;
    }
    dynamic getValueContain(Map data,String key,dynamic value,bool isString){

      if (!isString) {
        if(data.containsKey(key))  return int. parse(data[key].toString());
        return 0;
      }
      if(data.containsKey(key))  return data[key];
      return null;
    }

    Future<void> saveStogateData(LocalStogate saveData){
      Map dataCheck= toMap();
      dataCheck.forEach((k,v) async =>{
        await saveData.setValueString(k, v.toString())
      });
    }

}