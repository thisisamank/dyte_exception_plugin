import 'package:dyte_challenge/dyte_challenge.dart';
import 'package:dyte_challenge/src/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mock_method_channel.dart';

void main() {
  const MethodChannel channel = MethodChannel(Constants.methodChannelName);
  final DyteExceptionLogger dyteExceptionLogger = DyteExceptionLogger();
  setUp(() {
    dyteExceptionLogger.init();
  });

  channel.invokeMockMethod(Constants.functionName, "Some mock messages");

  test('testing', () {});
  TestWidgetsFlutterBinding.ensureInitialized();
}
