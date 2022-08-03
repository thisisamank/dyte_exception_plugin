import 'package:dyte_challenge/src/constants.dart';
import 'package:dyte_challenge/src/dyte_exception.dart';
import 'package:dyte_challenge/src/http_service.dart';
import 'package:dyte_challenge/src/log_exception_repository.dart';
import 'package:dyte_challenge/src/response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'log_exception_repository_test.mocks.dart';

class HttpMockService extends Mock implements HttpService {}

@GenerateMocks([HttpMockService])
void main() {
  final httpService = MockHttpMockService();
  final LogExceptionRepository sut = LogExceptionRepositoryImpl(httpService);
  const String mockData = 'mockData';
  final response = Response(mockData, 201);
  final dyteException = DyteException(message: mockData, time: DateTime.now());

  test('testing if the method gets invoked', () async {
    when(httpService.post(
            url: Constants.logSendEndpoint, data: dyteException.toJson()))
        .thenAnswer((_) async => response);

    httpService.post(
        url: Constants.logSendEndpoint, data: dyteException.toJson());

    verify(httpService.post(
        url: Constants.logSendEndpoint, data: dyteException.toJson()));
  });

  test('testing if the method returns right value', () async {
    when(httpService.post(
            url: Constants.logSendEndpoint, data: dyteException.toJson()))
        .thenAnswer((_) async => response);

    final responseFromServer = await sut.sendDataToServer(dyteException);

    verify(httpService.post(
            url: Constants.logSendEndpoint, data: dyteException.toJson()))
        .called(1);
    expectLater(responseFromServer, isA<Response>());
    expectLater(responseFromServer.statusCode, 201);
    expectLater(responseFromServer.message, mockData);
  });
}
