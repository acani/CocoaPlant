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
             dictionaryKey:(NSString *)dictionaryKey
             attributeName:(NSString *)attributeName
      managedObjectContext:(NSManagedObjectContext *)context {

    if (![servedDictionaries count]) return;

    // Create sets of all servedIDs & fetchedIDs.
    NSArray *servedIDs = [servedDictionaries valueForKeyPath:dictionaryKey];
    NSMutableSet *servedIDsSet = [NSMutableSet setWithArray:servedIDs];

    NSFetchRequest *fetchRequest = NSFetchRequestMake(NSStringFromClass(self), context);
    fetchRequest.returnsObjectsAsFaults = NO;
    fetchRequest.relationshipKeyPathsForPrefetching = [self relationshipKeyPathsForUpdating];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K IN %@",
                              attributeName, servedIDsSet];
    fetchRequest.sortDescriptors = NSSortDescriptors1(attributeName, YES);
    NSArray *fetchedObjects = MOCFetch(context, fetchRequest);

    // Update all fetchedObjects.
    BOOL newServedDictionariesReturned;
    if ([fetchedObjects count]) {
        // Get fetchedServedDictionaries, sorted by objectID, like fetchedObjects.
        NSArray *fetchedServedDictionaries;        
        NSSet *fetchedIDsSet = [NSSet setWithArray:[fetchedObjects valueForKeyPath:attributeName]];
        newServedDictionariesReturned = ![fetchedIDsSet isEqualToSet:servedIDsSet];
        if (newServedDictionariesReturned) {
            NSPredicate *dictionaryPredicate = [NSPredicate predicateWithFormat:@"%K IN %@",
                                                dictionaryKey, fetchedIDsSet];
            fetchedServedDictionaries = [servedDictionaries
                                         filteredArrayUsingPredicate:dictionaryPredicate];
            
            // Remove fetchedServedDictionaries from servedDictionaries to prepare for insert below.
            [servedIDsSet minusSet:fetchedIDsSet];
            dictionaryPredicate = [NSPredicate predicateWithFormat:@"%K IN %@",
                                   dictionaryKey, servedIDsSet];
            servedDictionaries = [servedDictionaries filteredArrayUsingPredicate:dictionaryPredicate];
        } else {
            fetchedServedDictionaries = servedDictionaries;
        }
        fetchedServedDictionaries = [fetchedServedDictionaries sortedArrayUsingDescriptors:
                                     NSSortDescriptors1(dictionaryKey, YES)];        

        NSUInteger idx = 0;
        for (CPResourcefulManagedObject *object in fetchedObjects) {
            // TODO: Fix bug. objectAtIndex 4 beyond bounds 0-3.
            [object updateWithDictionary:[fetchedServedDictionaries objectAtIndex:idx]];
            ++idx;
        }
    } else {
        newServedDictionariesReturned = YES;
    }

    // Insert & update the new servedDictionaries.
    if (newServedDictionariesReturned) {
        for (NSDictionary *dictionary in servedDictionaries) {
            [[self insertIntoManagedObjectContext:context] updateWithDictionary:dictionary];
        }
    }
}

+ (NSArray *)relationshipKeyPathsForUpdating { return [NSArray array]; }

- (BOOL)updateWithDictionary:(NSDictionary *)dictionary { return YES; }

@end
