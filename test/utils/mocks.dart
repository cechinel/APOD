import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:faker/faker.dart';

class Mocks {
  static ApodDto get astronomyPictureToday {
    final faker = Faker();

    return ApodDto(
      url: faker.image.image(),
      hdurl: faker.image.image(),
      title: faker.lorem.word(),
      date: faker.date.dateTime(),
      mediaType: faker.image.image(),
      explanation: faker.lorem.word(),
      serviceVersion: faker.lorem.word(),
    );
  }
}
