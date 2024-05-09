import '../entities/apod_entity.dart';

class ApodDto extends ApodEntity {
  ApodDto({
    super.copyright,
    required super.url,
    required super.hdurl,
    required super.title,
    required super.date,
    required super.mediaType,
    required super.explanation,
    required super.serviceVersion,
  });

  factory ApodDto.fromMap(Map<String, dynamic> map) {
    return ApodDto(
      copyright: map['copyright'],
      url: map['url'] ?? '',
      hdurl: map['hdurl'] ?? '',
      title: map['title'] ?? '',
      date: DateTime.tryParse(map['date'] ?? '') ?? DateTime.now(),
      mediaType: map['media_type'] ?? '',
      explanation: map['explanation'] ?? '',
      serviceVersion: map['service_version'] ?? '',
    );
  }
}
