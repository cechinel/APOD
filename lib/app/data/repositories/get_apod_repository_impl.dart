import '../../domain/entities/apod_entity.dart';
import '../../domain/repositories/get_apod_repository.dart';

class GetApodRepositoryImpl implements GetApodRepository {
  final GetApodRepository repository;

  GetApodRepositoryImpl(
    this.repository,
  );

  @override
  Future<ApodEntity> call() async {
    return await repository();
  }
}
