import 'package:apod/app/domain/models/apod_dto.dart';

abstract class GetApodRepository {
  Future<ApodDto> call();
}
