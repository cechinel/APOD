import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/services/exceptions/apod_generic_exception.dart';

import '../repositories/get_apod_in_cache_repository.dart';
import './get_apod_in_cache_usecase.dart';

class GetApodInCacheUsecaseImpl implements GetApodInCacheUsecase {
  final GetApodInCacheRepository _repository;

  GetApodInCacheUsecaseImpl(this._repository);

  @override
  Future<List<ApodDto>> call() async {
    try {
      return await _repository();
    } catch (_) {
      throw ApodGenericException();
    }
  }
}
