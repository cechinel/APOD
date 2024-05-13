import 'package:apod/services/client_https/base/client_https_base_impl.dart';
import 'package:dio/dio.dart';

class ClientHttps extends ClientHttpsBaseImpl {
  ClientHttps({
    super.httpClientAdapter,
    super.interceptors,
  }) : super(
          BaseOptions(baseUrl: 'https://api.nasa.gov'),
        );
}
