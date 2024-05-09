import '../entities/apod_entity.dart';

abstract class GetApodRepository {
  Future<ApodEntity> call();
}
