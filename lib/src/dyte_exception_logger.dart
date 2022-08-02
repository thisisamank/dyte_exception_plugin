import 'package:dyte_challenge/src/constants.dart';
import 'package:dyte_challenge/src/exception_logger_facade.dart';
import 'package:flutter/services.dart';

class DyteExceptionLogger {
  final MethodChannel _channel =
      const MethodChannel(Constants.methodChannelName);
  void init() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == Constants.functionName) {
        await ExceptionLoggerFacade.sendDataToServer(call.arguments);
      }
      return Future.value("Success!");
    });
  }
}
