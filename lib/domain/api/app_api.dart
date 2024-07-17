import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/globals.dart';
import '../helpers/dio_helper.dart';

class AppApi {
  Future<Map<String, dynamic>> getApiData(String url,
      {Map<String, dynamic>? query}) async {
    try {
      Response response =
          await DioHelper.getData(url: url, token: userToken, query: query);
      debugPrint(response.data.toString());
      return response.data;
    } catch (e) {
      debugPrint("Error in url get Api call {$url} :$e");
      return {};
    }
  }

  Future<Map<String, dynamic>> postApiData(
      String url, Map<String, dynamic> data,
      {isForm = true}) async {
    try {
      debugPrint("post $url");
      Response response = await DioHelper.postData(
          url: url, token: userToken, data: data, isForm: isForm);
      debugPrint(response.data.toString());
      return response.data;
    } catch (e) {
      debugPrint("Error in url post Api call {$url} :$e");
      return {};
    }
  }
}
