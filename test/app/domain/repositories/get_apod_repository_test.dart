import 'package:apod/app/data/datasources/get_apod_datasource.dart';
import 'package:apod/app/data/repositories/get_apod_repository_impl.dart';
import 'package:apod/app/domain/entities/apod_entity.dart';
import 'package:apod/app/domain/repositories/get_apod_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/mocks.dart';
import 'get_apod_repository_test.mocks.dart';

@GenerateMocks([GetApodDatasource])
void main() {
  late GetApodDatasource datasource;
  late GetApodRepository repository;
  late ApodEntity apodEntityFaker;

  setUp(() {
    datasource = MockGetApodDatasource();
    repository = GetApodRepositoryImpl(datasource);

    apodEntityFaker = Mocks.astronomyPictureToday;
  });

  test('Should return an ApodEntity when request is success', () async {
    when(repository()).thenAnswer((_) => Future.value(apodEntityFaker));

    final astronomyPictureOfTheDay = await repository();

    expect(astronomyPictureOfTheDay, isA<ApodEntity>());
  });
}
