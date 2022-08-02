import 'package:dyte_challenge/src/dyte_exception.dart';
import 'package:dyte_challenge/src/http_service.dart';
import 'package:dyte_challenge/src/log_exception_repository.dart';

class ExceptionLoggerFacade {
  static Future<void> sendDataToServer(String data) async {
    final HttpService httpService = MockHttpService();
    final LogExceptionRepository logExceptionRepository =
        LogExceptionRepositoryImpl(httpService);
    final DyteException dyteException = DyteException(
      message: data,
      time: DateTime.now(),
    );
    await logExceptionRepository.sendDataToServer(dyteException);
  }
}
