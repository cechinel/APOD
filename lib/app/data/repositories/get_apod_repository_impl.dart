import 'package:apod/app/data/datasources/get_apod_datasource.dart';
import 'package:apod/services/exceptions/apod_generic_exception.dart';

import '../../domain/entities/apod_entity.dart';
import '../../domain/repositories/get_apod_repository.dart';

class GetApodRepositoryImpl implements GetApodRepository {
  final GetApodDatasource _datasource;

  GetApodRepositoryImpl(
    this._datasource,
  );

  @override
  Future<ApodEntity> call() async {
    try {
      return await _datasource();
    } catch (_) {
      throw ApodGenericException();
    }
  }
}
