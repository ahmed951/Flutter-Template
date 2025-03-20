import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/globals.dart';
import '../../constants/strings.dart';
import '../../presentation/shared/toasts.dart';
import '../helpers/dio_helper.dart';

class AppApi {
  Future<Map<String, dynamic>> getApiData(String url,
      {Map<String, dynamic>? query}) async {
    try {
      Response response =
          await DioHelper.getData(url: url, token: userToken, query: query);

      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        toast("Unauthorized");
        navigatorKey.currentState!
            .pushNamedAndRemoveUntil(loginRoute, (route) => false);
        return {"statusCode": 401, "data": "Unauthorized"};
      }
      if (e.response != null) {
        debugPrint("Error response: ${e.response?.data}");
        return {
          "statusCode": e.response?.statusCode,
          "data": e.response?.data["data"],
        };
      } else {
        debugPrint("DioError without response: $e");
        return {"statusCode": null, "data": "Unexpected error occurred"};
      }
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return {"statusCode": null, "data": "Unexpected error occurred"};
    } /* catch (e) {
      debugPrint("Error in url get Api call {$url} :$e");
      if (e.toString().contains("401")) {
        toast("Unauthorized");
      }
      return {};
    } */
  }

  Future<Map<String, dynamic>> postApiData(
      String url, Map<String, dynamic> data,
      {isForm = false}) async {
    try {
      debugPrint("post $url");
      Response response = await DioHelper.postData(
        url: url,
        token: userToken,
        data: data,
        isForm: isForm,
      );
      debugPrint(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 401) {
          toast("Unauthorized");
          return {"statusCode": 401, "data": "Unauthorized"};
        }
        debugPrint("Error response: ${e.response?.data}");
        dynamic data = "";
        if (e.response?.data["data"] != null) {
          data = e.response?.data["data"];
        } else if (e.response?.data["errors"] != null) {
          data = e.response?.data["errors"];
        }
        return {
          "statusCode": e.response?.statusCode,
          "data": data,
        };
      } else {
        debugPrint("DioError without response: $e");
        return {"statusCode": null, "data": "Unexpected error occurred"};
      }
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return {"statusCode": null, "data": "Unexpected error occurred"};
    } /* catch (e) {
      debugPrint("Error in url post Api call {$url} :$e");
      if (e.toString().contains("401")) {
        toast("Unauthorized");
      }
      return {};
    } */
  }

  Future<Map<String, dynamic>> putApiData(
    String url,
    Map<String, dynamic> data, {
    isForm = false,
    Map<String, dynamic>? query,
  }) async {
    try {
      debugPrint("put $url");
      Response response = await DioHelper.putData(
          url: url, token: userToken, data: data, isForm: isForm, query: query);
      debugPrint(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        toast("Unauthorized");
        return {"statusCode": 401, "data": "Unauthorized"};
      }
      if (e.response != null) {
        debugPrint("Error response: ${e.response?.data}");
        dynamic data = "";
        if (e.response?.data["data"] != null) {
          data = e.response?.data["data"];
        } else if (e.response?.data["errors"] != null) {
          data = e.response?.data["errors"];
        }
        return {
          "statusCode": e.response?.statusCode,
          "data": data,
        };
      } else {
        debugPrint("DioError without response: $e");
        return {"statusCode": null, "data": "Unexpected error occurred"};
      }
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return {"statusCode": null, "data": "Unexpected error occurred"};
    }
  }

  Future<Map<String, dynamic>> patchApiData(
    String url,
    Map<String, dynamic> data, {
    isForm = false,
    Map<String, dynamic>? query,
  }) async {
    try {
      debugPrint("patch $url");
      Response response = await DioHelper.patchApiData(
          url: url, token: userToken, data: data, isForm: isForm, query: query);
      debugPrint(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        toast("Unauthorized");
        return {"statusCode": 401, "data": "Unauthorized"};
      }
      if (e.response != null) {
        debugPrint("Error response: ${e.response?.data}");
        dynamic data = "";
        if (e.response?.data["data"] != null) {
          data = e.response?.data["data"];
        } else if (e.response?.data["errors"] != null) {
          data = e.response?.data["errors"];
        }
        return {
          "statusCode": e.response?.statusCode,
          "data": data,
        };
      } else {
        debugPrint("DioError without response: $e");
        return {"statusCode": null, "data": "Unexpected error occurred"};
      }
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return {"statusCode": null, "data": "Unexpected error occurred"};
    }
  }

  Future<Map<String, dynamic>> deleteApiData(String url,
      {required dynamic id}) async {
    try {
      debugPrint("delete $url");
      debugPrint("id = $id");
      Response response =
          await DioHelper.deleteData(url: "$url/$id", token: userToken);
      debugPrint(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        toast("Unauthorized");
        return {"statusCode": 401, "data": "Unauthorized"};
      }
      if (e.response != null) {
        debugPrint("Error response: ${e.response}");
        return {
          "statusCode": e.response?.statusCode,
          "data": e.response!.data == null ? "" : e.response?.data["data"],
        };
      } else {
        debugPrint("DioError without response: $e");
        return {"statusCode": null, "data": "Unexpected error occurred"};
      }
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return {"statusCode": null, "data": "Unexpected error occurred"};
    }
  }
}
