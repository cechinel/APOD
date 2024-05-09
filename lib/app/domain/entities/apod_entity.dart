class ApodEntity {
  final String? copyright;
  final String url;
  final String hdurl;
  final String title;
  final DateTime date;
  final String mediaType;
  final String explanation;
  final String serviceVersion;

  ApodEntity({
    this.copyright,
    required this.url,
    required this.hdurl,
    required this.title,
    required this.date,
    required this.mediaType,
    required this.explanation,
    required this.serviceVersion,
  });
}
