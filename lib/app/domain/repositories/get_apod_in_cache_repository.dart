import '../../domain/models/apod_dto.dart';

abstract class GetApodInCacheRepository {
  Future<List<ApodDto>> call();
}
