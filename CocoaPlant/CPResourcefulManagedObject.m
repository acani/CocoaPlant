#import "CPResourcefulManagedObject.h"
#import "NSManagedObject+CocoaPlant.h"

@implementation CPResourcefulManagedObject

+ (void)updateAllWithArray:(NSArray *)servedDictionaries
                   keyPath:(NSString *)keyPath 
             attributeName:(NSString *)attributeName
             dictionaryKey:(NSString *)dictionaryKey
      managedObjectContext:(NSManagedObjectContext *)context {
    
    // Get a set of all the served IDs.
    NSMutableSet *servedIDsSet = [NSMutableSet setWithArray:[servedDictionaries valueForKeyPath:keyPath]];
        
    if ([servedIDsSet count] == 0) return;
    
    // Get an array of all the fetched IDs.
    // TODO: handle fetch error
    NSArray *fetchedObjects = 
    [[self class] fetchInManagedObjectContext:context error:NULL 
                                      options:^(NSFetchRequest *request) {
                                          NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K IN %@", attributeName, servedIDsSet];
                                          DLog(@"predicate: %@", pred);
                                          request.predicate = pred;
    }];
    
    // Array of all the fetched IDs (in core data).
    DLog(@"fetched object ids: %@", [fetchedObjects valueForKeyPath:attributeName]);
    NSSet *fetchedIDs = [NSSet setWithArray:[fetchedObjects valueForKeyPath:attributeName]];
    DLog(@"fetched ids: %@", fetchedIDs);
    
    /*
     * Insert the new objects (served - fetched).
     */
    DLog(@"served ids: %@", servedIDsSet);
    NSMutableSet *newServedIDs = [NSMutableSet setWithSet:servedIDsSet];
    DLog(@"new served ids 1: %@", newServedIDs);
    DLog(@"- fetched ids: %@", fetchedIDs);
    [newServedIDs minusSet:fetchedIDs];
    DLog(@"new served ids 2: %@", newServedIDs);
    
    NSPredicate *dictionaryPredicate = [NSPredicate predicateWithFormat:@"%K IN %@", 
                                        dictionaryKey, newServedIDs];
    NSArray *newServedDictionaries = [servedDictionaries
                                      filteredArrayUsingPredicate:dictionaryPredicate];

    for (NSDictionary *dictionary in newServedDictionaries) {
        CPResourcefulManagedObject *resource = [self insertIntoManagedObjectContext:context];
        [resource updateWithDictionary:dictionary];
    }

    /*
     * Update oldFetchedObjects (served & fetched).
     */
    NSMutableSet *oldIDs = [servedIDsSet mutableCopy]; [oldIDs intersectSet:fetchedIDs];

    dictionaryPredicate = [NSPredicate predicateWithFormat:@"%K IN %@", dictionaryKey, oldIDs];
    NSPredicate *objectPredicate = [NSPredicate predicateWithFormat:@"%K IN %@", attributeName, oldIDs];

    NSArray *oldServedDictionaries = [servedDictionaries filteredArrayUsingPredicate:dictionaryPredicate];
    NSArray *oldFetchedObjects = [fetchedObjects filteredArrayUsingPredicate:objectPredicate];
    
    // Sort both arrays by object ID so that they're in sync for iteration below.
    NSArray *dictionarySortDescriptors = [NSArray arrayWithObject:
                                          [NSSortDescriptor sortDescriptorWithKey:dictionaryKey
                                                                        ascending:YES]];
    NSArray *objectSortDescriptors = [NSArray arrayWithObject:
                                      [NSSortDescriptor sortDescriptorWithKey:attributeName
                                                                    ascending:YES]];

    oldServedDictionaries = [oldServedDictionaries sortedArrayUsingDescriptors:dictionarySortDescriptors];
    oldFetchedObjects = [oldFetchedObjects sortedArrayUsingDescriptors:objectSortDescriptors];
    
    [oldFetchedObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj updateWithDictionary:[oldServedDictionaries objectAtIndex:idx]];
    }];
}

- (BOOL)updateWithDictionary:(NSDictionary *)dictionary { return YES; }

@end
