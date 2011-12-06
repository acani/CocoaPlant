#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_5_0

#import "UIViewController+CocoaPlant.h"
#include <objc/runtime.h>

// Dynamically add @property (nonatomic,readonly) UIViewController *parentViewController.
UIViewController *presentingViewController4(id self, SEL _cmd);
UIViewController *presentingViewController4(id self, SEL _cmd) {
    return [self parentViewController];
}

@implementation UIViewController (CocoaPlant)

+ (void)load {
    if (![UIViewController instancesRespondToSelector:@selector(presentingViewController)]) {
        class_addMethod([self class], @selector(presentingViewController),
                        (IMP)presentingViewController4, "@@:");
    }
}

@end

#endif
