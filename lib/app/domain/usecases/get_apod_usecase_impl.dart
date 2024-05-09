import '../entities/apod_entity.dart';
import '../repositories/get_apod_repository.dart';
import './get_apod_usecase.dart';

class GetApodUsecaseImpl implements GetApodUsecase {
  final GetApodRepository repository;

  GetApodUsecaseImpl(this.repository);

  @override
  Future<ApodEntity> call() async {
    return await repository();
  }
}
