import 'package:apod/app/domain/entities/apod_entity.dart';
import 'package:apod/app/domain/repositories/get_apod_repository.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase_impl.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_apod_usecase_test.mocks.dart';

@GenerateMocks([GetApodRepository])
void main() {
  late GetApodUsecase usecase;
  late GetApodRepository repository;
  late Faker faker;
  late ApodEntity apodEntityFaker;

  setUp(() {
    faker = Faker();
    repository = MockGetApodRepository();
    usecase = GetApodUsecaseImpl(repository);

    apodEntityFaker = ApodEntity(
      url: faker.image.image(),
      hdurl: faker.image.image(),
      title: faker.lorem.word(),
      date: faker.date.dateTime(),
      mediaType: faker.image.image(),
      explanation: faker.lorem.word(),
      serviceVersion: faker.lorem.word(),
    );
  });

  test('Should return an ApodEntity when request is success', () async {
    when(repository()).thenAnswer((_) => Future.value(apodEntityFaker));

    final astronomyPictureOfTheDay = await usecase();

    expect(astronomyPictureOfTheDay, isA<ApodEntity>());
  });
}
