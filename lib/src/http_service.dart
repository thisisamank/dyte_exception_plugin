import 'dart:developer';

import 'package:dyte_challenge/src/response.dart';

abstract class HttpService {
  Future<Response> get({required String url});
  Future<Response> post({required String url, dynamic data});
}

class MockHttpService implements HttpService {
  final int _mockHttpResponseTime = 2;
  final String _successMessage = 'Request Successful';
  final int _getSuccessStatusCode = 200;
  final int _postSuccessStatusCode = 201;

  @override
  Future<Response> get({required String url}) async {
    Future.delayed(Duration(seconds: _mockHttpResponseTime), () {
      log('GET $_successMessage.');
      log(url);
    });
    return Response("GET request success", _getSuccessStatusCode);
  }

  @override
  Future<Response> post({required String url, dynamic data}) async {
    Future.delayed(Duration(seconds: _mockHttpResponseTime), () {
      log('POST $_successMessage.');
      log(url);
      log(data);
    });
    return Response(data, _postSuccessStatusCode);
  }
}
