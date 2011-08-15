#import "NSManagedObject+CocoaPlant.h"

@implementation NSManagedObject (CocoaPlant)

+ (NSString *)entityName {
    return NSStringFromClass(self);
}

+ (id)insertIntoContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                         inManagedObjectContext:context];
}

+ (NSEntityDescription *)entityInContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:context];
}

+ (NSArray *)fetchInContext:(NSManagedObjectContext *)context error:(NSError **)error
                    options:(void (^)(NSFetchRequest *request))options {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[self entityInContext:context]];

    if (options) {
        options(fetchRequest);
    }

    return [context executeFetchRequest:fetchRequest error:error];
}

@end
