import 'package:apod/app/data/datasources/get_apod_datasource.dart';
import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/services/exceptions/apod_generic_exception.dart';

import '../../../services/exceptions/apod_server_exception.dart';
import '../../domain/repositories/get_apod_repository.dart';

class GetApodRepositoryImpl implements GetApodRepository {
  final GetApodDatasource _datasource;

  GetApodRepositoryImpl(
    this._datasource,
  );

  @override
  Future<List<ApodDto>> call({
    required int size,
    DateTime? date,
  }) async {
    try {
      return await _datasource(size: size, date: date);
    } on ApodServerException {
      rethrow;
    } catch (_) {
      throw ApodGenericException();
    }
  }
}
