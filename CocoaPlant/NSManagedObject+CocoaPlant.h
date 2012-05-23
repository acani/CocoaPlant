#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define MOCFetch(managedObjectContext, fetchRequest) \
NSManagedObjectContextFetch(self, _cmd, managedObjectContext, fetchRequest)

#define MOCFetchAll(managedObjectContext, entityName) \
NSManagedObjectContextFetch(self, _cmd, managedObjectContext, NSFetchRequestMake(entityName, managedObjectContext))

#define MOCDeleteAll(managedObjectContext, entityName, cascadeRelationships) \
NSManagedObjectContextDeleteAll(self, _cmd, managedObjectContext, entityName, cascadeRelationships)

NS_INLINE NSFetchRequest *NSFetchRequestMake(NSString *entityName,
                                             NSManagedObjectContext *managedObjectContext);

NS_INLINE NSArray *NSManagedObjectContextFetch(id self, SEL _cmd,
                                               NSManagedObjectContext *managedObjectContext,
                                               NSFetchRequest *fetchRequest);

NS_INLINE void NSManagedObjectContextDeleteAll(id self, SEL _cmd,
                                               NSManagedObjectContext *managedObjectContext,
                                               NSString *entityName,
                                               NSArray *cascadeRelationships);

// NS_INLINE Implementations

NS_INLINE NSFetchRequest *NSFetchRequestMake(NSString *entityName,
                                             NSManagedObjectContext *managedObjectContext) {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_5_0 // iOS Deployment Target
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = [NSEntityDescription entityForName:entityName
                                      inManagedObjectContext:managedObjectContext];
    return fetchRequest;
#else
    return [NSFetchRequest fetchRequestWithEntityName:entityName];
#endif
}

NS_INLINE NSArray *NSManagedObjectContextFetch(id self, SEL _cmd,
                                               NSManagedObjectContext *managedObjectContext,
                                               NSFetchRequest *fetchRequest) {
    NSError *error = nil;
    NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    NSAssert(fetchedObjects, @"error: %@", error);
    return fetchedObjects;
}

NS_INLINE void NSManagedObjectContextDeleteAll(id self, SEL _cmd,
                                               NSManagedObjectContext *managedObjectContext,
                                               NSString *entityName,
                                               NSArray *cascadeRelationships) {
    NSFetchRequest *fetchRequest = NSFetchRequestMake(entityName, managedObjectContext);
    fetchRequest.includesPropertyValues = NO;
    fetchRequest.includesPendingChanges = NO;
    fetchRequest.relationshipKeyPathsForPrefetching = cascadeRelationships;
    NSArray *fetchedObjects = MOCFetch(managedObjectContext, fetchRequest);
    
    for (NSManagedObject *fetchedObject in fetchedObjects) {
        [managedObjectContext deleteObject:fetchedObject];
    }
}

@interface NSManagedObject (CocoaPlant)

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)context;
+ (id)insertIntoManagedObjectContext:(NSManagedObjectContext *)context;

- (void)delete;

@end
