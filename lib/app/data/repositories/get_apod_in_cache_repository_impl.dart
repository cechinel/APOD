import 'package:apod/app/domain/models/apod_dto.dart';

import '../../../services/exceptions/apod_generic_exception.dart';
import '../../domain/repositories/get_apod_in_cache_repository.dart';
import '../datasources/get_apod_in_cache_datasource.dart';

class GetApodInCacheRepositoryImpl implements GetApodInCacheRepository {
  final GetApodInCacheDatasource _datasource;

  GetApodInCacheRepositoryImpl(this._datasource);

  @override
  Future<List<ApodDto>> call() async {
    try {
      return await _datasource();
    } catch (_) {
      throw ApodGenericException();
    }
  }
}
