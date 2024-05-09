import '../../domain/entity/apod_entity.dart';
import '../../domain/repositories/get_apod_repository.dart';

class GetApodRepositoryImpl implements GetApodRepository {
  final GetApodRepository repository;

  GetApodRepositoryImpl(
    this.repository,
  );

  @override
  Future<APODEntity> call() async {
    return await repository();
  }
}
