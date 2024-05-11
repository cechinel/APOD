import './apod_exception.dart';

class ApodGenericException extends ApodException {
  static const String defaultMessage = 'An unexpected error occurred';
  static const String defaultError = 'NT_GENERIC_EXCEPTION';

  ApodGenericException() : super(defaultMessage, defaultError);
}
