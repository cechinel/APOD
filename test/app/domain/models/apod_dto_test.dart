import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final faker = Faker();
  final date = faker.date.dateTime().toString();
  final mediaType = faker.lorem.word();
  final serviceVersion = faker.lorem.word();

  final apodDtoData = {
    'url': faker.image.image(),
    'hdurl': faker.image.image(),
    'title': faker.lorem.word(),
    'date': date,
    'media_type': mediaType,
    'explanation': faker.lorem.word(),
    'service_version': serviceVersion,
  };

  group('Should return correctly all the tests made with ApodDTO', () {
    test('Should return an ApodDTO from map data', () async {
      final result = ApodDto.fromMap(apodDtoData);

      expect(result, isA<ApodDto>());
    });

    test('Should convert map data to ApodDto', () async {
      final result = ApodDto.fromMap(apodDtoData);

      expect(result.url, apodDtoData['url']);
      expect(result.hdurl, apodDtoData['hdurl']);
      expect(result.title, apodDtoData['title']);
      expect(result.date, DateTime.parse(date));
      expect(result.mediaType, mediaType);
      expect(result.explanation, apodDtoData['explanation']);
      expect(result.serviceVersion, serviceVersion);
    });
  });
}
