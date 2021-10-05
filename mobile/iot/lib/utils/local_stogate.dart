import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStogate{


  Future<String> getValueString(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(value);
        // await prefs.setInt('counter', counter);
  }
  Future<String> setValueString(String value,String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(value,data);
    // await prefs.setInt('counter', counter);
  }
  Future<String> getValueToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    if (token == null) {
      return null;
    } else {
      try {
        //return TokenEntity.fromJson(json.decode(token));
      } catch (e) {
        print(e);
        return null;
      }
    }
    return prefs.getString('token');
    // await prefs.setInt('counter', counter);
  }

  Future<bool> getValueBool(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(value);
  }
  Future<int> getValueNumber(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(value);
  //  await prefs.setInt('counter', counter);
  }

}

@JsonSerializable()
class TokenEntity {
  @JsonKey()
  String token;

  TokenEntity({this.token});

  factory TokenEntity.fromJson(Map<String, dynamic> json) => _$TokenEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TokenEntityToJson(this);
}




TokenEntity _$TokenEntityFromJson(Map<String, dynamic> json) {
  return TokenEntity(
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$TokenEntityToJson(TokenEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
    };




