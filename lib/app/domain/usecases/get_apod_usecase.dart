import 'package:apod/app/domain/models/apod_dto.dart';

abstract class GetApodUsecase {
  Future<List<ApodDto>> call({
    required int size,
    DateTime? date,
  });
}
