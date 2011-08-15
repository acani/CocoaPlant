#import "CocoaPlant.h"

@implementation NSManagedObjectModel (CocoaPlant)

+ (NSManagedObjectModel *)modelWithDefaultURL {
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:[self defaultURL]];
}

+ (NSURL *)defaultURL {
    NSString *appName = [[NSBundle mainBundle] name];
    return [[NSBundle mainBundle] URLForResource:appName withExtension:@"momd"];
}

@end
