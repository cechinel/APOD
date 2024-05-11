import '../../domain/models/apod_dto.dart';

abstract class GetApodDatasource {
  Future<ApodDto> call();
}
