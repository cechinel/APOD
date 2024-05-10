import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return an ApodDTO from map data', () async {
    final faker = Faker();

    final apodData = {
      'url': faker.image.image(),
      'hdurl': faker.image.image(),
      'title': faker.lorem.word(),
      'date': faker.lorem.word(),
      'mediaType': faker.image.image(),
      'explanation': faker.lorem.word(),
      'serviceVersion': faker.lorem.word(),
    };

    final result = ApodDto.fromMap(apodData);

    expect(result, isA<ApodDto>());
  });
}
