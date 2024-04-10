import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiCaller {
  static const baseUrl = 'http://localhost:3000';
  static final _dio = Dio(BaseOptions(responseType: ResponseType.plain));

  Future<String> getModes() async {
    try {
      final response = await _dio.get('$baseUrl/mode');
      debugPrint('Status code: ${response.statusCode}');
      debugPrint(response.data.toString());

      final List<dynamic> responseData = jsonDecode(response.data.toString());
      debugPrint(responseData.length.toString());
      for (var i = 0; i < responseData.length; i++) {
        debugPrint(responseData[i]['name'].toString());
      }
      var data1 = responseData[0]['name'].toString();
      var data2 = responseData[1]['name'].toString();
      var data3 = responseData[2]['name'].toString();
      return data1 + " " + data2 + " " + data3;
    } catch (e) {
      debugPrint('Error: $e');
      throw 'Failed to fetch data';
    }
  }

  Future<String> getService(String endpoint) async {
    try {
      final response = await _dio.get('$baseUrl/$endpoint');
      debugPrint('Status code: ${response.statusCode}');
      debugPrint(response.data.toString());
      final List<dynamic> responseData = jsonDecode(response.data.toString());
      final data = responseData[0]['name'].toString();
      final data2 = responseData[1]['name'].toString();
      for (var i = 0; i < responseData.length; i++) {
        debugPrint(responseData[i]['name'].toString());
      }
      return data + " " + data2;
    } catch (e) {
      // Handle errors and show error message
      debugPrint('Error: $e');
      throw 'Failed to fetch data';
    }
  }

  Future<String> post(String endpoint,
      {required Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.post('$baseUrl/$endpoint', data: params);
      debugPrint(response.data.toString());
      return response.data.toString();
    } catch (e) {
      // Handle errors and show error message
      debugPrint('Error: $e');
      throw 'Failed to send data';
    }
  }
}
