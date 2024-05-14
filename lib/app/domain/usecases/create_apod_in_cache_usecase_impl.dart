import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/services/exceptions/apod_generic_exception.dart';

import '../repositories/create_apod_in_cache_repository.dart';
import './create_apod_in_cache_usecase.dart';

class CreateApodInCacheUsecaseImpl implements CreateApodInCacheUsecase {
  final CreateApodInCacheRepository _repository;

  CreateApodInCacheUsecaseImpl(this._repository);

  @override
  Future<void> call(List<ApodDto> apodDto) async {
    try {
      return await _repository(apodDto);
    } catch (_) {
      throw ApodGenericException();
    }
  }
}
