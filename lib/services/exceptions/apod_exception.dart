class ApodException implements Exception {
  final String message;
  final String error;
  final int? statusCode;
  final StackTrace? stackTrace;
  final dynamic exception;

  ApodException({
    required this.message,
    required this.error,
    this.statusCode,
    this.stackTrace,
    this.exception,
  });
}
