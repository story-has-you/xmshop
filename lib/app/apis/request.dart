import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Request request = Request();

class Request {
  static const baseUrl = "https://xiaomi.itying.com";
  static const connectTimeout = 15000;
  static const receiveTimeout = 500;
  static const successCode = 200;
  static final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: connectTimeout,
    receiveTimeout: receiveTimeout,
  ));

  Request() {
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        int? statusCode = response.statusCode;
        if (statusCode != 200) {
          Fluttertoast.showToast(
            msg: "网络错误, 请稍后重试",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
        return handler.next(response);
      },
    ));
  }

  Future<Response<T>> fetch<T>(String url, {method = "get", data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    Options options = Options()
      ..method = method
      ..headers = headers;
    return dio.request(baseUrl + url, queryParameters: queryParameters, data: data, options: options);
  }

  static String replaceUrl(String url) {
    return url.replaceAll("\\", "/");
  }
}
