import 'package:dio/dio.dart';

Request request = Request();

class Request {
  static const baseUrl = "https://xiaomi.itying.com/api";
  static const connectTimeout = 15000;
  static const receiveTimeout = 500;
  static const successCode = 200;
  late Dio _dio;

  Request() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    ));
  }

  Future<dynamic> request(String url, {String method = "GET", Map<String, dynamic>? queryParameters, data, Map<String, dynamic>? headers}) async {
    Options options = Options()
      ..method = method
      ..headers = headers;

    Response response = await _dio.request(baseUrl + url, queryParameters: queryParameters, data: data, options: options);
    return response.data;
  }
}
