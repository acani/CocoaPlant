#import "CPResourcefulManagedObject.h"
#import "NSManagedObject+CocoaPlant.h"

@implementation CPResourcefulManagedObject

+ (id)updateOrInsertWithDictionary:(NSDictionary *)dictionary
                     dictionaryKey:(NSString *)dictionaryKey
                     attributeName:(NSString *)attributeName
            inManagedObjectContext:(NSManagedObjectContext *)context {
    // Fetch with the ID Key.
    id fetchedObject = [self fetchFirstInManagedObjectContext:context error:NULL options:^(NSFetchRequest *request) {
        request.predicate = [NSPredicate predicateWithFormat:@"%K == %@", attributeName, [dictionary objectForKey:dictionaryKey]];
    }];

    if (!fetchedObject) {
        fetchedObject = [self insertIntoManagedObjectContext:context];
    }

    [fetchedObject updateWithDictionary:dictionary];
    return fetchedObject;
}

// TODO: Test!
+ (void)updateAllWithArray:(NSArray *)servedDictionaries
                   keyPath:(NSString *)keyPath
             attributeName:(NSString *)attributeName
             dictionaryKey:(NSString *)dictionaryKey
      managedObjectContext:(NSManagedObjectContext *)context {

    // Create sets of all servedIDs & fetchedIDs.
    NSArray *servedIDs = [servedDictionaries valueForKeyPath:keyPath];
    if ([servedIDs count] == 0) return;
    NSMutableSet *servedIDsSet = [NSMutableSet setWithArray:servedIDs];
    NSArray *fetchedObjects = // TODO: handle fetch error.
    [self fetchInManagedObjectContext:context error:NULL options:^(NSFetchRequest *request) {
        request.predicate = [NSPredicate predicateWithFormat:@"%K IN %@",
                             attributeName, servedIDsSet];
    }];
    NSSet *fetchedIDsSet = [NSSet setWithArray:[fetchedObjects valueForKeyPath:attributeName]];

    // Insert newServedDictionaries (served - fetched).
    NSMutableSet *newServedIDsSet = [servedIDsSet mutableCopy];
    [newServedIDsSet minusSet:fetchedIDsSet];
    NSPredicate *dictionaryPredicate = [NSPredicate predicateWithFormat:@"%K IN %@",
                                        dictionaryKey, newServedIDsSet];
    NSArray *newServedDictionaries = [servedDictionaries
                                      filteredArrayUsingPredicate:dictionaryPredicate];
    for (NSDictionary *dictionary in newServedDictionaries) {
        CPResourcefulManagedObject *resource = [self insertIntoManagedObjectContext:context];
        [resource updateWithDictionary:dictionary];
    }

    // Update oldFetchedObjects (served & fetched).
    [servedIDsSet intersectSet:fetchedIDsSet];
    dictionaryPredicate = [NSPredicate predicateWithFormat:@"%K IN %@",
                           dictionaryKey, servedIDsSet];
    NSPredicate *objectPredicate = [NSPredicate predicateWithFormat:@"%K IN %@",
                                    attributeName, servedIDsSet];
    NSArray *oldServedDictionaries = [servedDictionaries
                                      filteredArrayUsingPredicate:dictionaryPredicate];
    NSArray *oldFetchedObjects = [fetchedObjects filteredArrayUsingPredicate:objectPredicate];

    // Sort both arrays by object ID so that they're in sync for iteration below.
    NSArray *dictionarySortDescriptors = [NSArray arrayWithObject:
                                          [NSSortDescriptor sortDescriptorWithKey:dictionaryKey
                                                                        ascending:YES]];
    NSArray *objectSortDescriptors = [NSArray arrayWithObject:
                                      [NSSortDescriptor sortDescriptorWithKey:attributeName
                                                                    ascending:YES]];
    oldServedDictionaries = [oldServedDictionaries
                             sortedArrayUsingDescriptors:dictionarySortDescriptors];
    oldFetchedObjects = [oldFetchedObjects sortedArrayUsingDescriptors:objectSortDescriptors];

    [oldFetchedObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj updateWithDictionary:[oldServedDictionaries objectAtIndex:idx]];
    }];
}

- (BOOL)updateWithDictionary:(NSDictionary *)dictionary { return YES; }

@end
