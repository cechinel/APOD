import 'package:apod/app/data/datasources/get_apod_datasource.dart';

import '../../services/client_https/client_https.dart';
import '../domain/models/apod_dto.dart';

class GetApodDatasourceImpl implements GetApodDatasource {
  final ClientHttps _clientHttps;

  GetApodDatasourceImpl(
    this._clientHttps,
  );

  final _clientEnpoint = "/planetary/apod";

  @override
  Future<ApodDto> call() async {
    final response = await _clientHttps.get(_clientEnpoint);

    return ApodDto.fromMap(response.data);
  }
}
