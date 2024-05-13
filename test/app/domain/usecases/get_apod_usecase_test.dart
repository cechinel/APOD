import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/domain/repositories/get_apod_repository.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase_impl.dart';
import 'package:apod/services/exceptions/apod_generic_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/mocks.dart';
import 'get_apod_usecase_test.mocks.dart';

@GenerateMocks([GetApodRepository])
void main() {
  late GetApodUsecase usecase;
  late GetApodRepository repository;
  late ApodDto apodDtoFaker;

  setUp(() {
    repository = MockGetApodRepository();
    usecase = GetApodUsecaseImpl(repository);

    apodDtoFaker = Mocks.astronomyPictureOfTheDay;
  });

  test('Should return an ApodEntity when request is success', () async {
    const size = 5;
    final mockList = List.generate(size, (index) => apodDtoFaker);

    when(repository(size: 5)).thenAnswer((_) async => mockList);

    final astronomyPictureOfTheDay = await usecase(size: size);

    expect(astronomyPictureOfTheDay, isA<List<ApodDto>>());
  });

  test('Should return an exception when request fails', () async {
    const size = 5;

    when(repository(size: size)).thenThrow(Exception());

    final result = usecase(size: size);

    expect(result, throwsA(isA<ApodGenericException>()));
  });

  test('Should call repository with correct parameters', () async {
    const size = 5;

    when(repository(size: size)).thenAnswer((_) async => []);

    await usecase(size: size);

    verify(repository(size: size)).called(1);
  });

  test('Should throw an exception when size is less than 1', () async {
    const size = 0;

    expect(() async => await usecase(size: size),
        throwsA(isA<ApodGenericException>()));
  });

  test('Should throw an exception when size is too large', () async {
    const size = 1000;

    expect(() async => await usecase(size: size),
        throwsA(isA<ApodGenericException>()));
  });
}
