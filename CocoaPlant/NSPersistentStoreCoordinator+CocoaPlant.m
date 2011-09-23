#import "NSFileManager+CocoaPlant.h"
#import "NSManagedObjectModel+CocoaPlant.h"
#import "NSPersistentStore+CocoaPlant.h"
#import "NSPersistentStoreCoordinator+CocoaPlant.h"

@implementation NSPersistentStoreCoordinator (CocoaPlant)

+ (NSPersistentStoreCoordinator *)coordinatorWithDefaultModel {
    return [[NSPersistentStoreCoordinator alloc]
            initWithManagedObjectModel:[NSManagedObjectModel modelWithDefaultURL]];
}

+ (NSPersistentStoreCoordinator *)coordinatorWithStoreType:(NSString *)storeType
                                                     error:(NSError **)error {
    NSPersistentStoreCoordinator *coordinator = [NSPersistentStoreCoordinator
                                                 coordinatorWithDefaultModel];
    [coordinator addStoreWithType:storeType error:error];
    return coordinator;
}

- (NSPersistentStore *)addStoreWithType:(NSString *)storeType error:(NSError **)error {
    return [self addPersistentStoreWithType:storeType configuration:nil
                                        URL:[NSPersistentStore defaultURL] options:nil error:error];
}

@end
