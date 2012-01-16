#import "NSBundle+CocoaPlant.h"

@implementation NSBundle (CocoaPlant)

- (NSString *)name {
    return [[self infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
}

- (NSString *)version {
    return [[self infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
}

@end
