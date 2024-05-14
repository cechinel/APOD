import 'package:apod/app/domain/models/apod_dto.dart';

abstract class GetApodInCacheUsecase {
  Future<List<ApodDto>> call();
}
