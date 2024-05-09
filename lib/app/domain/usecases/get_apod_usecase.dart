import '../entities/apod_entity.dart';

abstract class GetApodUsecase {
  Future<ApodEntity> call();
}
