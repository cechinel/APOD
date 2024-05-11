import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/services/exceptions/apod_generic_exception.dart';

import '../repositories/get_apod_repository.dart';
import './get_apod_usecase.dart';

class GetApodUsecaseImpl implements GetApodUsecase {
  final GetApodRepository _repository;

  GetApodUsecaseImpl(this._repository);

  @override
  Future<List<ApodDto>> call({
    required int size,
    DateTime? date,
  }) async {
    try {
      return await _repository(size: size, date: date);
    } catch (_) {
      throw ApodGenericException();
    }
  }
}
