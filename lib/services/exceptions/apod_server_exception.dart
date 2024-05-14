import './apod_exception.dart';

class ApodServerException extends ApodException {
  static const String defaultMessage = 'Server error occurred';
  static const String defaultError = 'SERVER_EXCEPTION';

  ApodServerException() : super(message: defaultMessage, error: defaultError);
}
