#import "NSManagedObject+CocoaPlant.h"

@implementation NSManagedObject (CocoaPlant)

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription entityForName:NSStringFromClass(self)
                       inManagedObjectContext:context];
}

+ (id)insertIntoManagedObjectContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(self)
                                         inManagedObjectContext:context];
}

- (void)delete {
    [self.managedObjectContext deleteObject:self];
}

@end
