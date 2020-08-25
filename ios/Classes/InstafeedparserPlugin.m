#import "InstafeedparserPlugin.h"
#if __has_include(<instafeedparser/instafeedparser-Swift.h>)
#import <instafeedparser/instafeedparser-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "instafeedparser-Swift.h"
#endif

@implementation InstafeedparserPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftInstafeedparserPlugin registerWithRegistrar:registrar];
}
@end
