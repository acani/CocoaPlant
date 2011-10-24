#import "NSManagedObject+CocoaPlant.h"

@implementation NSManagedObject (CocoaPlant)

+ (NSString *)entityName {
    return NSStringFromClass(self);
}

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:context];
}

+ (id)insertIntoManagedObjectContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                         inManagedObjectContext:context];
}

+ (NSFetchRequest *)fetchRequestInManagedObjectContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = [self entityInManagedObjectContext:context];
    return fetchRequest;
}

+ (NSArray *)fetchInManagedObjectContext:(NSManagedObjectContext *)context error:(NSError **)error
                    options:(NSFetchRequestOptions)options {
    NSFetchRequest *fetchRequest = [self fetchRequestInManagedObjectContext:context];

    if (options) {
        options(fetchRequest);
    }

    return [context executeFetchRequest:fetchRequest error:error];
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

@end
