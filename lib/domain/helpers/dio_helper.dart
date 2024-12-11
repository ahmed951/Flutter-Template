import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/strings.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20), // 20 seconds,
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token != "" ? "Bearer $token" : ""
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool isForm = false,
    String token = "",
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token != "" ? "Bearer $token" : ""
    };
    dynamic dataSent;
    if (isForm) {
      dataSent = FormData.fromMap(data!);
    } else {
      dataSent = data;
    }
    return await dio!.post(url, queryParameters: query, data: dataSent);
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    bool isForm = false,
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token != "" ? "Bearer $token" : "",
      //'Authorization': token != null ? "Bearer $token" : '',
      'Content-Type': 'application/json',
    };
    debugPrint(data.toString());
    dynamic dataSent;
    if (isForm) {
      dataSent = FormData.fromMap(data!);
    } else {
      dataSent = data;
    }
    debugPrint("DATA-->${dataSent.fields}");
    return await dio!.put(url, queryParameters: query, data: dataSent);
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token != "" ? "Bearer $token" : ""
    };

    return await dio!.delete(
      url,
      queryParameters: query,
    );
  }
}
