import 'package:dio/dio.dart';
import 'package:iot/config/http_config.dart';
import 'package:iot/utils/fox_dio_logger.dart';

import 'api_client.dart';

class ApiUtil {
  static ApiClient getApiClient() {
    final dio = Dio();
    dio.options.connectTimeout = 30000;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.interceptors.add(FoxDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 50,
    ));
    final apiClient = ApiClient(dio, baseUrl: HttpConfig.baseUrl);
    return apiClient;
  }

  static ApiClient uploadFileClient() {
    final dio = Dio();
    dio.options.connectTimeout = 30000;
    dio.options.headers['Accept'] = 'application/json';
    dio.interceptors.add(FoxDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 50,
    ));
    final apiClient = ApiClient(dio, baseUrl: HttpConfig.baseUrl);
    return apiClient;
  }
}
