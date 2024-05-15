import 'package:apod/app/data/datasources/get_apod_datasource.dart';
import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/domain/models/exceptions/handle_exception.dart';
import 'package:apod/app/domain/models/exceptions/handle_generic_exception.dart';

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
    } on HandledException catch (_) {
      rethrow;
    } catch (e) {
      throw HandledGenericException(e);
    }
  }
}
