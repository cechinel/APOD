import 'package:apod/app/data/datasources/get_apod_datasource.dart';
import 'package:apod/app/data/repositories/get_apod_repository_impl.dart';
import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/domain/repositories/get_apod_repository.dart';
import 'package:apod/services/exceptions/apod_generic_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/mocks.dart';
import 'get_apod_repository_test.mocks.dart';

@GenerateMocks([GetApodDatasource])
void main() {
  late GetApodDatasource datasource;
  late GetApodRepository repository;
  late ApodDto apodDtoFaker;

  setUp(() {
    datasource = MockGetApodDatasource();
    repository = GetApodRepositoryImpl(datasource);

    apodDtoFaker = Mocks.astronomyPictureOfTheDay;
  });

  test('Should return an ApodDto when request is success', () async {
    const size = 5;
    final mockList = List.generate(size, (index) => apodDtoFaker);

    when(datasource(size: size)).thenAnswer((_) async => mockList);

    final astronomyPictureOfTheDay = await repository(size: size);

    expect(astronomyPictureOfTheDay, isA<List<ApodDto>>());
  });

  test('Should throw an exception when request fails', () async {
    const size = 5;

    when(datasource(size: size)).thenThrow(Exception());

    final result = repository(size: size);

    expect(result, throwsA(isA<ApodGenericException>()));
  });
}
