
import 'app_exception.dart';

class TimeoutCustomException extends AppException {
  TimeoutCustomException()
      : super(
          error: 'TimeoutException',
          message: 'timeout',
        );
}
