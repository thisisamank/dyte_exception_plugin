#import "DyteChallengePlugin.h"
#if __has_include(<dyte_challenge/dyte_challenge-Swift.h>)
#import <dyte_challenge/dyte_challenge-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dyte_challenge-Swift.h"
#endif

@implementation DyteChallengePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDyteChallengePlugin registerWithRegistrar:registrar];
}
@end
