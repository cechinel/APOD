import 'package:apod/app/domain/models/apod_dto.dart';

abstract class GetApodUsecase {
  Future<ApodDto> call();
}
