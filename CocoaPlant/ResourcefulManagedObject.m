#import "ResourcefulManagedObject.h"
#import "NSManagedObject+CocoaPlant.h"

@implementation ResourcefulManagedObject

+ (void)updateAllWithArray:(NSArray *)servedArray
                   keyPath:(NSString *)keyPath 
             attributeName:(NSString *)attributeName
             dictionaryKey:(NSString *)dictionaryKey
      managedObjectContext:(NSManagedObjectContext *)context {
    
    // Get a set of all the served IDs.
    NSMutableSet *servedIDs = [servedArray mutableSetValueForKeyPath:keyPath];
    [servedIDs unionSet:[servedArray mutableSetValueForKeyPath:keyPath]];
    
    // Get a set of all the fetched IDs.
    // TODO: handle fetch error
    NSArray *fetchedObjects = [self fetchInManagedObjectContext:context error:NULL 
                                                      options:^(NSFetchRequest *request) {
        request.predicate = [NSPredicate predicateWithFormat:@"%K IN %@", attributeName, servedIDs];
    }];
    
    // Array of all the fetched IDs (in core data).
    NSMutableSet *fetchedIDs = [fetchedObjects mutableSetValueForKeyPath:attributeName];

    // Pluck out the IDs that will be added to core data.
    NSMutableSet *newServedIDs = [servedIDs mutableCopy]; [newServedIDs minusSet:fetchedIDs];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K IN %@", dictionaryKey, newServedIDs];
    NSArray *newServedDictionaries = [servedArray filteredArrayUsingPredicate:predicate];

    // Add the new items to core data.
    for (NSDictionary *dictionary in newServedDictionaries) {
        ResourcefulManagedObject *resource = [self insertIntoManagedObjectContext:context];
        [resource updateWithDictionary:dictionary];
    }

//    // Update existingFetchedObjects (served & fetched).
//    NSMutableSet *existingObjectIDs = [NSMutableSet setWithArray:servedObjectIDs];
//    [existingObjectIDs intersectSet:fetchedIDs];
//    
//    predicate = [NSPredicate predicateWithFormat:@"videoID IN %@", existingObjectIDs];
//    NSArray *existingServedObjects = [servedObjects filteredArrayUsingPredicate:predicate];
//    NSArray *existingFetchedObjects = [fetchedObjects filteredArrayUsingPredicate:predicate];
//    
//    NSArray *sortDescriptors = [NSArray arrayWithObject:
//                                [NSSortDescriptor sortDescriptorWithKey:@"videoID" ascending:YES]];
//    existingServedObjects = [existingServedObjects sortedArrayUsingDescriptors:sortDescriptors];
//    existingFetchedObjects = [existingFetchedObjects sortedArrayUsingDescriptors:sortDescriptors];
//    
//    [existingFetchedObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        [obj updateWithEntry:[existingServedObjects objectAtIndex:idx]];
//    }];

    
//    // Update the fetchedIDs that exist in servedIDs.
//    for (ResourcefulManagedObject *rmo in fetchedObjects) {
//        [rmo updateWithDictionary: ];
//    }
}

- (void)updateWithDictionary:(NSDictionary *)dictionary { }

@end
