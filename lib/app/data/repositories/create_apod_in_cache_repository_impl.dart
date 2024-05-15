import 'package:apod/app/data/datasources/create_apod_in_cache_datasource.dart';
import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/domain/repositories/create_apod_in_cache_repository.dart';

import '../../domain/models/exceptions/handle_exception.dart';
import '../../domain/models/exceptions/handle_generic_exception.dart';

class CreateApodInCacheRepositoryImpl implements CreateApodInCacheRepository {
  final CreateApodInCacheDataSource _datasource;

  CreateApodInCacheRepositoryImpl(this._datasource);

  @override
  Future<void> call(List<ApodDto> apodDto) async {
    try {
      return await _datasource(apodDto);
    } on HandledException catch (_) {
      rethrow;
    } catch (e) {
      throw HandledGenericException(e);
    }
  }
}
