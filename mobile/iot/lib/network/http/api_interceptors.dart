import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:iot/config/SettingInfo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiInterceptors extends PrettyDioLogger {

  @override
  // TODO: implement requestHeader
  bool get requestHeader => super.requestHeader;

  @override
  Future onRequest(RequestOptions options) {
    final method = options?.method;
    final uri = options?.uri;
    final data = options?.data;

    /// ADD TOKEN TO HEADER
    if (SettingInfo().GetUserInfor().tockenAcess != null) {
      options?.headers['Authorization'] = 'Beard ${SettingInfo().GetUserInfor().tockenAcess}';
    }

    if (method == 'GET') {
      log("✈️ REQUEST[$method] => PATH: $uri \n Token: ${options?.headers}");
    } else {
      log("✈️ REQUEST[$method] => PATH: $uri \n Token: ${SettingInfo().GetUserInfor().tockenAcess} \n DATA: $data");
    }

    log('HEARS: ${options?.headers}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    final statusCode = response?.statusCode;
    final uri = response?.request?.uri;
    final data = jsonEncode(response?.data);
    print("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    final statusCode = err?.response?.statusCode;
    final uri = err?.request?.path;
    print("⚠️ ERROR[$statusCode] => PATH: $uri \n Data: ${err?.response?.data}");
    return super.onError(err);
  }
}
