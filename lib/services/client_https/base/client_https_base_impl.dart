import 'package:apod/services/client_https/base/client_https_base.dart';
import 'package:dio/dio.dart';

import '../../exceptions/apod_exception.dart';

class ClientHttpsBaseImpl implements ClientHttpsBase {
  final Dio _dio;

  ClientHttpsBaseImpl(
    BaseOptions baseOptions, {
    List<Interceptor>? interceptors,
    HttpClientAdapter? httpClientAdapter,
  }) : _dio = Dio(baseOptions) {
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
    if (httpClientAdapter != null) {
      _dio.httpClientAdapter = httpClientAdapter;
    }
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return throw ApodException(
          message: e.response!.data.toString(),
          error: e.error.toString(),
          statusCode: e.response!.statusCode,
          stackTrace: e.stackTrace,
          exception: e,
        );
      } else {
        return throw ApodException(
          message: e.message!,
          error: 'DIO_ERROR',
        );
      }
    }
  }
}
