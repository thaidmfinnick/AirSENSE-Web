import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import '../../config/http_config.dart';


@RestApi(baseUrl: HttpConfig.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  /// GET Master Data
  @GET("/api/auth/dictionaries")
  Future<dynamic> getDictionaries(@Query("language_id") int languageId);
}

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<dynamic> getDictionaries(languageId) async {
    ArgumentError.checkNotNull(languageId, 'languageId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'language_id': languageId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/api/auth/dictionaries',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }
}