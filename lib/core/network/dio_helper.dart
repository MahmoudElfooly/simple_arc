import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_app/core/extensions/buildcontext_extensions.dart';

import '../../main.dart';
import '../baseRepo/bearer_token_repo.dart';
import '../coreInfo/core_info.dart';
import 'exceptions/exceptions.dart';
import 'logging_interceptor.dart';

class DioHelper {
  static String baseUrl = "http://38.242.140.146:9854";
  static String api = "$baseUrl/api";
  Dio? dio;

  DioHelper() {
    onInit();
  }

  @override
  void onInit() {
    dio = Dio(
      BaseOptions(
        headers: {
          "Accept": "application/json",
          'content-Type': 'application/json',
          "authorization": "Bearer ${BearerTokenRepo().getBearerToken()}"
        },
      ),
    );
    if (!kReleaseMode) {
      dio?.interceptors.add(LoggingInterceptor());
    }
  }

  Future<dynamic> postDataWithoutToken(String parameter, dynamic data) async {
    // print("$api/$parameter");
    final response = await dio?.post('$api/$parameter',
        data: data,
        options: Options(
          method: 'POST',
          // validateStatus: (state) => state! < 500,
          followRedirects: false,
          validateStatus: (status) => true,
        ));
    return handleResponse(response!);
  }

  Future<dynamic> postData(String parameter, dynamic data,
      {bool rawParameter = false}) async {
    // print(parameter);
    // print(data);
    if (kDebugMode) {
      print(dio?.options.headers);
    }
    final response =
        await dio?.post(rawParameter ? parameter : '$api/$parameter',
            data: data,
            options: Options(
              contentType: 'application/json',
              method: 'POST',
              // validateStatus: (state) => state! < 500,
              followRedirects: false,
              validateStatus: (status) => true,
            ));
    return handleResponse(response!);
  }

  Future<dynamic> putData(
    String parameter,
    Map<String, dynamic> data,
  ) async {
    final response = await dio?.put('$api/$parameter',
        data: json.encoder.convert(data),
        options: Options(
          contentType: 'application/json',
          method: 'PUT',
          validateStatus: (state) => state! < 500,
        ));
    return handleResponse(response!);
  }

  Future<dynamic> deleteData(
    String parameter,
  ) async {
    final response = await dio?.delete('$api/$parameter',
        options: Options(
          contentType: 'application/json',
          method: 'DEL',
          validateStatus: (state) => state! < 500,
        ));
    return handleResponse(response!);
  }

  Future<Map<String, dynamic>> getDataWithoutToken(String parameter) async {
    Response? response = await dio?.get('$api/$parameter');
    return handleResponse(response!);
  }

  Future<dynamic> getData(String parameter, {bool rawParameter = false}) async {
    Response? response =
        await dio?.get(rawParameter ? parameter : '$api/$parameter',
            options: Options(
              contentType: 'application/json',
              method: 'GET',
              followRedirects: false,
              validateStatus: (status) => true,
            ));
    return handleResponse(response!);
  }

  dynamic handleResponse(Response response) {
    log(response.statusCode.toString());
    log(response.data.toString());
    if (response.statusCode.toString()[0] != "2" ||
        (response.data is Map &&
            (response.data["statusCode"] ?? response.data["code"]).toString() !=
                "200")) {
      log(response.data.toString());
      if (response.data is Map &&
          ((response.data["statusCode"] ?? response.data["code"]).toString() ==
                  "401" ||
              (response.data["statusCode"] ?? response.data["code"])
                      .toString() ==
                  "404")) {
        CoreInfo.logout();
      }
      throw ServerException(
          exceptionMessage: response.data[
              navigatorKey.currentContext!.isEnglish ? "message" : "messageAr"],
          statusCode: response.data["statusCode"]);
    }
    return response.data;
  }
}
