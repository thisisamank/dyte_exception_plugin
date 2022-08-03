import 'package:dyte_challenge/src/constants.dart';
import 'package:dyte_challenge/src/exception_logger_facade.dart';
import 'package:flutter/services.dart';

class DyteExceptionLogger {
  static const MethodChannel _channel =
      MethodChannel(Constants.methodChannelName);

  /// [DyteExceptionLogger.init()] method initializes the plugin. Once the plugin is
  /// initialized it starts listening for any [Exception] raised on the android
  /// native platform. If any [Exception] is caught there it is sent at the flutter
  /// side to send back to backend.
  static void init() => _checkForIncomingCallbacks();

  static void _checkForIncomingCallbacks() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == Constants.functionName) {
        await ExceptionLoggerFacade.sendDataToServer(call.arguments);
      }
      return Future.value();
    });
  }
}
