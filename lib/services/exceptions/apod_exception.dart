abstract class ApodException implements Exception {
  final String message;
  final String error;

  ApodException({
    this.message = 'An unexpected error occurred.',
    this.error = 'APOD_GENERIC_EXCEPTION',
  });
}
