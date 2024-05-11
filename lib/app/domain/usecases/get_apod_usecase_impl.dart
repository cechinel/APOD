import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/services/exceptions/apod_generic_exception.dart';

import '../repositories/get_apod_repository.dart';
import './get_apod_usecase.dart';

class GetApodUsecaseImpl implements GetApodUsecase {
  final GetApodRepository _repository;

  GetApodUsecaseImpl(this._repository);

  @override
  Future<ApodDto> call() async {
    try {
      return await _repository();
    } catch (_) {
      throw ApodGenericException();
    }
  }
}
