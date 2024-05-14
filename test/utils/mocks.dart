import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:faker/faker.dart';

class Mocks {
  ApodDto get astronomyPictureOfTheDay {
    final faker = Faker();

    return ApodDto(
      copyright: faker.person.name(),
      url: faker.image.image(),
      hdurl: faker.image.image(),
      title: faker.lorem.word(),
      date: faker.date.dateTime(),
      mediaType: faker.image.image(),
      explanation: faker.lorem.sentence(),
      serviceVersion: faker.lorem.word(),
    );
  }
}
