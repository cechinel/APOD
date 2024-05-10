import 'package:apod/app/data/datasources/get_apod_datasource.dart';

import '../../domain/entities/apod_entity.dart';
import '../../domain/repositories/get_apod_repository.dart';

class GetApodRepositoryImpl implements GetApodRepository {
  final GetApodDatasource datasource;

  GetApodRepositoryImpl(
    this.datasource,
  );

  @override
  Future<ApodEntity> call() async {
    return await datasource();
  }
}
