import 'package:dio/dio.dart';

class DioHttpClient {
  final Dio dio = Dio();

  DioHttpClient() {
    _setupDio();
  }

  void _setupDio() {
    dio.options.baseUrl = 'https://rickandmortyapi.com/api/';
    dio.options.connectTimeout = const Duration(seconds: 30).inMilliseconds;
  }
}
