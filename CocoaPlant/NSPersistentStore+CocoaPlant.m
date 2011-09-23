#import "NSPersistentStore+CocoaPlant.h"
#import "NSBundle+CocoaPlant.h"
#import "NSFileManager+CocoaPlant.h"

@implementation NSPersistentStore (CocoaPlant)

+ (NSURL *)defaultURL {
    NSString *appName = [[NSBundle mainBundle] name];
    NSString *storeFilename = [[NSString alloc] initWithFormat:@"%@.sqlite", appName];
    return [[[[NSFileManager alloc] init] URLForApplicationDocumentDirectory]
            URLByAppendingPathComponent:storeFilename];
}

@end
