import 'package:dyte_challenge/src/dyte_exception.dart';
import 'package:dyte_challenge/src/http_service.dart';
import 'package:dyte_challenge/src/log_exception_repository.dart';
import 'package:dyte_challenge/src/response.dart';

class ExceptionLoggerFacade {
  /// [ExceptionLoggerFacade] is used to initialize all the components used to
  /// log Exceptions sent by native android side. [data] in Parameter is converted to
  /// [DyteException] to add more details.

  static Future<Response> sendDataToServer(String data) async {
    final HttpService httpService = MockHttpService();
    final LogExceptionRepository logExceptionRepository =
        LogExceptionRepositoryImpl(httpService);
    final DyteException dyteException = DyteException(
      message: data,
      time: DateTime.now(),
    );
    return await logExceptionRepository.sendDataToServer(dyteException);
  }
}
