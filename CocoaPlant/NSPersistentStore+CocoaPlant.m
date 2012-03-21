#import "NSPersistentStore+CocoaPlant.h"
#import "NSBundle+CocoaPlant.h"
#import "NSFileManager+CocoaPlant.h"

@implementation NSPersistentStore (CocoaPlant)

+ (NSURL *)defaultURL {
    return [[[NSFileManager defaultManager] URLForApplicationDocumentDirectory]
            URLByAppendingPathComponent:
            [NSString stringWithFormat:@"%@.sqlite", [[NSBundle mainBundle] name]]];
}

@end
