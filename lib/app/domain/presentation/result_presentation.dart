import '../models/exceptions/handle_exception.dart';

class ResultPresentation {
  final String? message;
  final bool success;
  final String? error;
  final dynamic payload;

  ResultPresentation({
    this.success = true,
    this.message,
    this.error = '',
    this.payload,
  });

  factory ResultPresentation.exception(
    HandledException exception, {
    dynamic payload,
  }) {
    return ResultPresentation(
      success: false,
      message: exception.message ?? '',
      error: exception.error ?? '',
      payload: payload,
    );
  }
}
