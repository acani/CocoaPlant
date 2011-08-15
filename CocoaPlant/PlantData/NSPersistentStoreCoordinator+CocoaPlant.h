#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSPersistentStoreCoordinator (CocoaPlant)

+ (NSPersistentStoreCoordinator *)coordinatorWithDefaultModel;
+ (NSPersistentStoreCoordinator *)coordinatorWithStoreType:(NSString *)storeType
                                                     error:(NSError **)error;
- (NSPersistentStore *)addStoreWithType:(NSString *)storeType error:(NSError **)error;

@end
