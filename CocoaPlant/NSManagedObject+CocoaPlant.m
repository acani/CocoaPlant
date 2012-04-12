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

+ (NSArray *)fetchInManagedObjectContext:(NSManagedObjectContext *)context error:(NSError **)error
                    options:(NSFetchRequestOptions)options {
    NSFetchRequest *fetchRequest = NSFetchRequestMake(NSStringFromClass(self), context);

    if (options) {
        options(fetchRequest);
    }

//    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:error];
    return [context executeFetchRequest:fetchRequest error:error];
}

+ (id)fetchFirstInManagedObjectContext:(NSManagedObjectContext *)context
                                 error:(NSError **)error
                               options:(NSFetchRequestOptions)options {
    NSArray *fetchedObjects = [self fetchInManagedObjectContext:context error:error options:options];
    return ([fetchedObjects count] ? [fetchedObjects objectAtIndex:0] : nil);
}

+ (BOOL)deleteAllInManagedObjectContext:(NSManagedObjectContext *)context error:(NSError **)error {
    NSArray *results = [self fetchInManagedObjectContext:context error:error
                                                 options:^(NSFetchRequest *request) {
        [request setIncludesPropertyValues:NO];
    }];

    for (NSManagedObject *managedObject in results) {
        [context deleteObject:managedObject];
    }

    return results ? YES : NO;
}

- (void)delete {
    [self.managedObjectContext deleteObject:self];
}

@end
