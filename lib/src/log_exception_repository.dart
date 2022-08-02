import 'package:dyte_challenge/src/constants.dart';
import 'package:dyte_challenge/src/dyte_exception.dart';
import 'package:dyte_challenge/src/http_service.dart';
import 'package:dyte_challenge/src/response.dart';

abstract class LogExceptionRepository {
  Future<Response> sendDataToServer(DyteException exception);
}

class LogExceptionRepositoryImpl extends LogExceptionRepository {
  LogExceptionRepositoryImpl(this._httpService);

  final HttpService _httpService;

  @override
  Future<Response> sendDataToServer(DyteException exception) async {
    final response = await _httpService.post(
        url: Constants.logSendEndpoint, data: exception.toJson());
    if (response.statusCode == 201) {
      return response;
    }
    throw Exception('POST request to server unsuccessful!');
  }
}
