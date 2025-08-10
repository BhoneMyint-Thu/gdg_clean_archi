import 'package:dio/dio.dart';

class DioUtil {
  static Future<Response> postAPI(
    String url, {
    required Dio dio,
    dynamic bodyParam,
    Map<String, dynamic>? queryParam,
  }) async {
    final options = Options(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    final response = await dio.post(
      url,
      options: options,
      data: bodyParam,
      queryParameters: queryParam,
    );
    return response;
  }

  static Future<Response> putAPI(
    String url, {
    required Dio dio,
    dynamic bodyParam,
    Map<String, dynamic>? queryParam,
  }) async {
    final options = Options(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    final response = await dio.put(
      url,
      options: options,
      data: bodyParam,
      queryParameters: queryParam,
    );
    return response;
  }

  static Future<Response> getAPI(
    String url, {
    required Dio dio,
    Map<String, dynamic>? queryParam,
  }) async {
    final options = Options(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    final response = await dio.get(
      url,
      options: options,
      queryParameters: queryParam,
    );
    return response;
  }
}
