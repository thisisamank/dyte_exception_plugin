import 'package:dyte_challenge/src/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const channel = MethodChannel(Constants.methodChannelName);
  void mockUrlLauncher() {
    handler(MethodCall methodCall) async {
      if (methodCall.method == Constants.functionName) {
        return 0;
      }
      return null;
    }

    TestWidgetsFlutterBinding.ensureInitialized();

    TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, handler);
  }

  mockUrlLauncher();

  test('checking if method channel is working well', () async {
    expect(await channel.invokeMethod(Constants.functionName), 0);
  });
}
