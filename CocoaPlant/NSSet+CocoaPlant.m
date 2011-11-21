#import "NSSet+CocoaPlant.h"
#import "NSManagedObject+CocoaPlant.h"

@implementation NSSet (CocoaPlant)

- (void)deleteAll {
    for (NSManagedObject *object in self) {
        [object delete];
    }
}

@end
