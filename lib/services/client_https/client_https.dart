import 'package:apod/services/client_https/interceptors/api_key_interceptor.dart';
import 'package:dio/dio.dart';

import './client_https_base.dart';

class ClientHttps extends ApodClientHttpsBase {
  ClientHttps({String? baseUrl, List<Interceptors>? interceptors})
      : super(
          BaseOptions(baseUrl: baseUrl ?? 'https://api.nasa.gov'),
          interceptors: [ApiKeyInterceptor()],
        );
}
