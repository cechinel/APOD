import '../entity/apod_entity.dart';

abstract class GetApodUsecase {
  Future<APODEntity> call();
}
