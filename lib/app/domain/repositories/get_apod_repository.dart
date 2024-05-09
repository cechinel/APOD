import '../entity/apod_entity.dart';

abstract class GetApodRepository {
  Future<APODEntity> call();
}
