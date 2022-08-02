import 'package:flutter_test/flutter_test.dart';
import 'package:dyte_challenge/dyte_challenge.dart';
import 'package:dyte_challenge/dyte_challenge_platform_interface.dart';
import 'package:dyte_challenge/dyte_challenge_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDyteChallengePlatform 
    with MockPlatformInterfaceMixin
    implements DyteChallengePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DyteChallengePlatform initialPlatform = DyteChallengePlatform.instance;

  test('$MethodChannelDyteChallenge is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDyteChallenge>());
  });

  test('getPlatformVersion', () async {
    DyteChallenge dyteChallengePlugin = DyteChallenge();
    MockDyteChallengePlatform fakePlatform = MockDyteChallengePlatform();
    DyteChallengePlatform.instance = fakePlatform;
  
    expect(await dyteChallengePlugin.getPlatformVersion(), '42');
  });
}
