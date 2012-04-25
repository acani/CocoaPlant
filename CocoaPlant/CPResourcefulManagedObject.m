#import "CocoaPlantDefines.h"
#import "CPResourcefulManagedObject.h"
#import "NSManagedObject+CocoaPlant.h"

@implementation CPResourcefulManagedObject

+ (id)updateOrInsertWithDictionary:(NSDictionary *)dictionary
                     attributeName:(NSString *)attributeName
                     dictionaryKey:(NSString *)dictionaryKey
            inManagedObjectContext:(NSManagedObjectContext *)context {
    // Fetch with the ID Key.
    NSFetchRequest *fetchRequest = NSFetchRequestMake(NSStringFromClass(self), context);
    fetchRequest.returnsObjectsAsFaults = NO;
    fetchRequest.relationshipKeyPathsForPrefetching = [self relationshipKeyPathsForUpdating];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@",
                              attributeName, [dictionary objectForKey:dictionaryKey]];
    NSArray *fetchedObjects = MOCFetch(context, fetchRequest);
    
    id object = ([fetchedObjects count] ? [fetchedObjects objectAtIndex:0] :
                 [self insertIntoManagedObjectContext:context]);

    [object updateWithDictionary:dictionary];
    return object;
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

    NSFetchRequest *fetchRequest = NSFetchRequestMake(NSStringFromClass(self), context);
    fetchRequest.returnsObjectsAsFaults = NO;
    fetchRequest.relationshipKeyPathsForPrefetching = [self relationshipKeyPathsForUpdating];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K IN %@",
                              attributeName, servedIDsSet];
    NSArray *fetchedObjects = MOCFetch(context, fetchRequest);

    NSSet *fetchedIDsSet = [NSSet setWithArray:[fetchedObjects valueForKeyPath:attributeName]];
    
    // Insert newServedDictionaries (served - fetched).
    NSMutableSet *newServedIDsSet = [NSMutableSet setWithSet:servedIDsSet];
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
    NSArray *dictionarySortDescriptors = NSSortDescriptors1(dictionaryKey, YES);
    NSArray *objectSortDescriptors = NSSortDescriptors1(attributeName, YES);
    oldServedDictionaries = [oldServedDictionaries
                             sortedArrayUsingDescriptors:dictionarySortDescriptors];
    oldFetchedObjects = [oldFetchedObjects sortedArrayUsingDescriptors:objectSortDescriptors];
    
    [oldFetchedObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        //        @try {
        // TODO: Fix bug. objectAtIndex 4 beyond bounds 0-3.
        [obj updateWithDictionary:[oldServedDictionaries objectAtIndex:idx]];
        //        }
        //        @catch (NSException *exception) {
        //            // TODO: Notify user & server that the server response was bad.
        //            DLog(@"derp! updateWithDictionary error: %@", exception);
        //        }
    }];
}

+ (NSArray *)relationshipKeyPathsForUpdating { return [NSArray array]; }

- (BOOL)updateWithDictionary:(NSDictionary *)dictionary { return YES; }

@end
