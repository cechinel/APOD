import 'package:apod/app/domain/models/apod_dto.dart';

abstract class CreateApodInCacheUsecase {
  Future<void> call(List<ApodDto> apodDto);
}
