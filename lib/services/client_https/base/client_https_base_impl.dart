import 'package:apod/app/domain/models/exceptions/handle_exception.dart';
import 'package:apod/services/client_https/base/client_https_base.dart';
import 'package:dio/dio.dart';

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

  HandledException _getExceptionInstance(DioException e) {
    dynamic error;
    if (e.response?.data['errors'] != null) {
      final errors = e.response!.data['errors'] as List;
      error = errors.first;
    } else {
      error = null;
    }

    final titleError = error?['title'];
    final messageError = error?['detail'];

    return HandledException(
      error: titleError ?? e.error,
      message: messageError ?? e.response?.statusMessage ?? '',
      statusCode: e.response?.statusCode ?? 500,
      exception: e,
    );
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
      throw _getExceptionInstance(e);
    }
  }
}
