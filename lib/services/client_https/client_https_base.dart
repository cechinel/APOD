import 'package:dio/dio.dart';

import '../exceptions/apod_exception.dart';

class ApodClientHttpsBase {
  final Dio _dio;

  ApodClientHttpsBase({
    BaseOptions? baseOptions,
  }) : _dio = Dio(baseOptions);

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApodException(
            e.response!.data.toString(), e.response!.statusCode.toString());
      } else {
        throw ApodException(e.message!, 'DIO_ERROR');
      }
    }
  }
}
