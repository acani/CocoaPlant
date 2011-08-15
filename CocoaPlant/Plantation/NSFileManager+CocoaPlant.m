#import "NSFileManager+CocoaPlant.h"

@implementation NSFileManager (CocoaPlant)

- (NSURL *)URLForApplicationDirectory:(NSSearchPathDirectory)directory {
    return [[self URLsForDirectory:directory inDomains:NSUserDomainMask] lastObject];
}

- (NSURL *)URLForApplicationLibraryDirectory {
    return [self URLForApplicationDirectory:NSLibraryDirectory];
}

- (NSURL *)URLForApplicationDocumentDirectory {
    return [self URLForApplicationDirectory:NSDocumentDirectory];
}

@end
