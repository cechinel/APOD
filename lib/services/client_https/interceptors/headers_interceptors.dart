import 'package:dio/dio.dart';

class HeadersInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers["accept"] = "application/json";
    options.headers["Accept-language"] = 'pt-br';
    const apiKey = 'DEMO_KEY';

    options.queryParameters.addAll({'api_key': apiKey});

    return handler.next(options);
  }
}
