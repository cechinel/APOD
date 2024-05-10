import '../../domain/entities/apod_entity.dart';

abstract class GetApodDatasource {
  Future<ApodEntity> call();
}
