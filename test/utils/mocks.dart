import 'package:apod/app/domain/entities/apod_entity.dart';
import 'package:faker/faker.dart';

class Mocks {
  static ApodEntity get astronomyPictureTodayEntity {
    final faker = Faker();

    return ApodEntity(
      url: faker.image.image(),
      hdurl: faker.image.image(),
      title: faker.lorem.word(),
      date: faker.date.dateTime(),
      mediaType: faker.lorem.word(),
      explanation: faker.lorem.word(),
      serviceVersion: faker.lorem.word(),
    );
  }
}
