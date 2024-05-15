import 'handle_exception.dart';

class HandledGenericException extends HandledException {
  HandledGenericException([Object? exception])
      : super(
          message: 'An unexpected error occurred',
          error: 'Error',
          exception: exception,
        );
}
