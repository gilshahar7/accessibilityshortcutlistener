#import <libactivator/libactivator.h>


@interface SBAccessibilityHardwareButtonInteraction
+(id)hardwareButtonInteractionForLockButton;
-(BOOL)consumeTriplePressUp;
@end

@interface AccessibilityShortcutListener : NSObject<LAListener>
@end

@implementation AccessibilityShortcutListener

-(void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
  //We got called! run some stuff.
  [[%c(SBAccessibilityHardwareButtonInteraction) hardwareButtonInteractionForLockButton] consumeTriplePressUp];
  [event setHandled:YES];
}

+(void)load {
  @autoreleasepool {
    [[LAActivator sharedInstance] registerListener:[self new] forName:@"com.gilshahar7.accessibilityshortcutlistener.toggle"];
  }
}

- (NSString *)activator:(LAActivator *)activator requiresLocalizedTitleForListenerName:(NSString *)listenerName {
    return @"Invoke accessibility shortcut";
}
- (NSString *)activator:(LAActivator *)activator requiresLocalizedDescriptionForListenerName:(NSString *)listenerName {
    return @"Simulates the triple click accessibility shortcut";
}
- (NSArray *)activator:(LAActivator *)activator requiresCompatibleEventModesForListenerWithName:(NSString *)listenerName {
    return [NSArray arrayWithObjects:@"springboard", @"lockscreen", @"application", nil];
}

@end
