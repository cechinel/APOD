import 'package:dio/dio.dart';

class HeadersInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers["accept"] = "application/json";
    options.headers["Accept-language"] = 'pt-br';

    options.queryParameters.addAll({
      'api_key': const String.fromEnvironment('API_KEY'),
    });

    return handler.next(options);
  }
}
