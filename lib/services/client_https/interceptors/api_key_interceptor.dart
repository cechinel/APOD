import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const apiKey = String.fromEnvironment('API_KEY');

    options.queryParameters.addAll({'api_key': apiKey});

    handler.next(options);
  }
}
