import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:e_commerce_code7x/cache_helper.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://application.x5smart.com/api/',
      receiveDataWhenStatusError: true,
    ));
   dio?.httpClientAdapter = DefaultHttpClientAdapter()..onHttpClientCreate = (HttpClient client) {
       client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
       return client;
     };


  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept-Language': CacheHelper.getData(key: 'lang'),
      'Authorization': 'Bearer $token',
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

 static Future<Response> postData({
   required String url,
   Map<String, dynamic>? data,
   Map<String, dynamic>? query,
   String? token,
 }) async {
   dio!.options.headers = {
     'Accept': 'application/json',
     'Accept-Encoding': 'gzip, deflate, br',
     'Accept-Language': CacheHelper.getData(key: 'lang'),
     'Authorization': 'Bearer $token',
   };
   try {
     return await dio!.post(
       url,
       data: data,
       queryParameters: query,
     );
   } catch (e, p) {
     debugPrint("=========================");
     debugPrint(e.toString());
     debugPrint(p.toString());
     debugPrint("=========================");
     rethrow;
   }
 }

  // static Future<Response> postData({
  //   required String url,
  //   Map<String, dynamic>? data,
  //   Map<String, dynamic>? query,
  //   String? token,
  // }) async {
  //   try {
  //     final response = await dio!.post(
  //       url,
  //       data: data,
  //       options: Options(
  //         validateStatus: (status) {
  //           return status! < 500; // Accept status codes below 500
  //         },
  //       ),
  //     );
  //     print(response.data);
  //     return response;
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       // Handle the response error
  //       print('STATUS: ${e.response?.statusCode}');
  //       print('DATA: ${e.response?.data}');
  //       if (e.response?.statusCode == 422) {
  //         // Handle specific case for 422 status code
  //         print('Validation error: ${e.response?.data}');
  //         rethrow;
  //       }
  //       rethrow;
  //     } else {
  //       // Handle other errors, e.g., connection errors
  //       print('Error sending request!');
  //       print(e.message);
  //       rethrow;
  //     }
  //   }
  // }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept-Language': CacheHelper.getData(key: 'lang'),
      'Authorization': 'Bearer $token',
    };

    return await dio!.delete(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
