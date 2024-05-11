class ApodException implements Exception {
  final String message;
  final String error;

  ApodException(
    this.message,
    this.error,
  );
}
