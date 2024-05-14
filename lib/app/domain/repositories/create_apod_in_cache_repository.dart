import '../../domain/models/apod_dto.dart';

abstract class CreateApodInCacheRepository {
  Future<void> call(List<ApodDto> apodDto);
}
