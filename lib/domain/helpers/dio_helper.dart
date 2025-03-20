import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:template/constants/globals.dart';

import '../../constants/strings.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60), // 20 seconds,
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    if (!isServer) {
      dio!.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          // Don't trust any certificate just because their root cert is trusted.
          final HttpClient client =
              HttpClient(context: SecurityContext(withTrustedRoots: false));
          // You can test the intermediate / root cert here. We just ignore it.
          client.badCertificateCallback =
              ((X509Certificate cert, String host, int port) => true);
          return client;
        },
      );
    }
    dio!.interceptors.addAll([
      ErrorInterceptor(),
    ]);
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
    log(url);

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

    return await dio!.put(url, queryParameters: query, data: dataSent);
  }

  static Future<Response> patchApiData({
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
    debugPrint("data - > $data");
    dynamic dataSent;
    if (isForm) {
      dataSent = FormData.fromMap(data!);
    } else {
      dataSent = data;
    }
    return await dio!.patch(url, queryParameters: query, data: dataSent);
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

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 300;
    if (!isValid) {
      throw DioException.badResponse(
        statusCode: status!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    super.onResponse(response, handler);
  }
}
