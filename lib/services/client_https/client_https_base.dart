import 'package:dio/dio.dart';

import '../exceptions/apod_exception.dart';

class ApodClientHttpsBase {
  final Dio _dio;

  ApodClientHttpsBase(
    BaseOptions baseOptions, {
    List<Interceptor>? interceptors,
  }) : _dio = Dio(baseOptions) {
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }

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
