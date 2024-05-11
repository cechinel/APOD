import '../../domain/models/apod_dto.dart';

abstract class GetApodDatasource {
  Future<List<ApodDto>> call({
    required int size,
    DateTime? date,
  });
}
