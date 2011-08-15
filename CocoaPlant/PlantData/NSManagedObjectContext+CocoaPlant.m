#import "NSManagedObjectContext+CocoaPlant.h"
#import "NSPersistentStoreCoordinator+CocoaPlant.h"

@implementation NSManagedObjectContext (CocoaPlant)

+ (NSManagedObjectContext *)contextWithStoreType:(NSString *)storeType error:(NSError **)error {
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = [NSPersistentStoreCoordinator
                                          coordinatorWithStoreType:storeType error:error];
    return context;
}

@end
