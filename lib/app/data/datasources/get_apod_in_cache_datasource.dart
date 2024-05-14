import '../../domain/models/apod_dto.dart';

abstract class GetApodInCacheDatasource {
  Future<List<ApodDto>> call();
}
