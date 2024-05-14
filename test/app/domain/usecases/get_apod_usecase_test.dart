import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/domain/repositories/get_apod_repository.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/mocks.dart';
import 'get_apod_usecase_test.mocks.dart';

@GenerateMocks([GetApodRepository])
void main() {
  late GetApodUsecase usecase;
  late GetApodRepository repository;
  late Mocks apodMock;

  setUp(() {
    repository = MockGetApodRepository();
    usecase = GetApodUsecaseImpl(repository);

    apodMock = Mocks();
  });

  group('All the tests for get apod usecase', () {
    test('Should return an ApodEntity when request is success', () async {
      const size = 5;
      final mockList =
          List.generate(size, (index) => apodMock.astronomyPictureOfTheDay);

      when(repository(size: 5)).thenAnswer((_) async => mockList);

      final astronomyPictureOfTheDay = await usecase(size: size);

      expect(astronomyPictureOfTheDay, isA<List<ApodDto>>());
    });

    test('Should call repository with correct parameters', () async {
      const size = 5;

      when(repository(size: size)).thenAnswer((_) async => []);

      await usecase(size: size);

      verify(repository(size: size)).called(1);
    });
  });
}
