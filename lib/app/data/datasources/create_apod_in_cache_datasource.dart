import '../../domain/models/apod_dto.dart';

abstract class CreateApodInCacheDataSource {
  Future<void> call(List<ApodDto> apodDto);
}
