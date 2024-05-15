import 'package:apod/app/domain/models/apod_dto.dart';

import '../../domain/models/exceptions/handle_exception.dart';
import '../../domain/models/exceptions/handle_generic_exception.dart';
import '../../domain/repositories/get_apod_in_cache_repository.dart';
import '../datasources/get_apod_in_cache_datasource.dart';

class GetApodInCacheRepositoryImpl implements GetApodInCacheRepository {
  final GetApodInCacheDatasource _datasource;

  GetApodInCacheRepositoryImpl(this._datasource);

  @override
  Future<List<ApodDto>> call() async {
    try {
      return await _datasource();
    } on HandledException catch (_) {
      rethrow;
    } catch (e) {
      throw HandledGenericException(e);
    }
  }
}
