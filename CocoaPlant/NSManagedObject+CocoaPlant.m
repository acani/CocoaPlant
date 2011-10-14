#import "NSManagedObject+CocoaPlant.h"

@implementation NSManagedObject (CocoaPlant)

+ (NSString *)entityName {
    return NSStringFromClass(self);
}

+ (NSEntityDescription *)entityInContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:context];
}

+ (id)insertIntoContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                         inManagedObjectContext:context];
}

+ (NSFetchRequest *)fetchRequestInManagedObjectContext:(NSManagedObjectContext *)context
                                           withOptions:(NSFetchRequestOptions)options {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[self entityInContext:context]];

    if (options) {
        options(fetchRequest);
    }
    
    return fetchRequest;    
}

+ (NSArray *)fetchInManagedObjectContext:(NSManagedObjectContext *)context error:(NSError **)error
                    options:(void (^)(NSFetchRequest *request))options {
    NSFetchRequest *fetchRequest = [self fetchRequestInManagedObjectContext:context
                                                                withOptions:options];
    return [context executeFetchRequest:fetchRequest error:error];
}

+ (BOOL)deleteAllInContext:(NSManagedObjectContext *)context error:(NSError **)error {
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
