#import "NSBundle+CocoaPlant.h"

@implementation NSBundle (CocoaPlant)

- (NSString *)name {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
}

@end
