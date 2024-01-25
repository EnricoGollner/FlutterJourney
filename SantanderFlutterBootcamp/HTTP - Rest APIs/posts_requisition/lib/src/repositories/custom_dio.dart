import 'package:dio/dio.dart';

class CustomDio {
  final _dio = Dio();

  Dio get dio => _dio;

  CustomDio() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    _dio.options.connectTimeout = const Duration(seconds: 10);
  }
}