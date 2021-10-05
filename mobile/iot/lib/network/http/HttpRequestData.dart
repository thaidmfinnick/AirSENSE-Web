import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iot/config/SettingInfo.dart';

// retrofit - abtract


class HttpRequestData{

    Future<http.Response> fetchDataFromUri(String link) {
      Uri uri= Uri.http(link, "");
      return http.get(uri);
    }

    Object fetchDataJsonFromUri(String link) async {
      Uri uri= Uri.http(link, "");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final body = json.decode(response.body);
        return body;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return null;
      }
    }

    Future<http.Response> fetchPostDataFromUri(String link,Map<String, dynamic> dataImport) {
      Uri uri= Uri.http(link, "");
      return http.get(uri);
    }

    Future<Map> fetchPostDataJsonFromUri(String path ,Map<String, dynamic> dataImport) async {
      Uri uri= Uri.http(SettingInfo().GetHttpConfig().baseUrlServer,path);
      var jsonData=jsonEncode(dataImport);
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonData,
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final body = json.decode(response.body);
        return body;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return null;
      }
    }

    Future<Map> getPostDataJsonFromUri(String link,String path ,Map<String, dynamic> dataImport) async {
      Uri uri= Uri.http(link,path);
      var jsonData=jsonEncode(dataImport);
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonData,
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final body = json.decode(response.body);
        return body;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return null;
      }
    }

    Future<Map> getGetDataJsonFromUri(String link,String path ,String tocken) async {
      Uri uri= Uri.http(link,path);
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Beard '+tocken,
        }
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final body = json.decode(response.body);
        return body;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return null;
      }
    }

    Future<Map> getGetDataUserInfo(String tocken) async {
      Uri uri= Uri.http(SettingInfo().GetHttpConfig().baseUrlServer,"api/user/login");
      final response = await http.get(
          uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Beard '+tocken,
          }
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final body = json.decode(response.body);
        return body;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return null;
      }
    }


}

