import 'package:apod/app/data/datasources/get_apod_datasource.dart';

import '../../services/client_https/client_https.dart';
import '../../shared/format_date.dart';
import '../domain/models/apod_dto.dart';

class GetApodDatasourceImpl implements GetApodDatasource {
  final ClientHttps _clientHttps;

  GetApodDatasourceImpl(
    this._clientHttps,
  );

  final _clientEnpoint = '/planetary/apod';

  @override
  Future<List<ApodDto>> call({
    required int size,
    DateTime? date,
  }) async {
    final params =
        date == null ? {"count": size.toString()} : {"date": formatDate(date)};

    final response =
        await _clientHttps.get(_clientEnpoint, queryParameters: params);

    if (response.data is Map<String, dynamic>) {
      return [ApodDto.fromMap(response.data)];
    }

    final list = response.data as List? ?? [];

    return list.map((picture) => ApodDto.fromMap(picture)).toList();
  }
}
