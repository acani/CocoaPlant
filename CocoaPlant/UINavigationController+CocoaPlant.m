#import "UINavigationController+CocoaPlant.h"

@implementation UINavigationController (CocoaPlant)

- (UIViewController *)rootViewController {
    return [self.viewControllers objectAtIndex:0];
}

- (void)setRootViewController:(UIViewController *)rootViewController {
    self.viewControllers = [NSArray arrayWithObject:rootViewController];
}

@end
