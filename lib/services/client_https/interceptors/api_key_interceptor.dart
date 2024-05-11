import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const apiKey = 'OvUOfeF6SJ16SUxS22yfax9pOYGnOYWNvedwv0IW';

    options.queryParameters.addAll({'api_key': apiKey});

    handler.next(options);
  }
}
