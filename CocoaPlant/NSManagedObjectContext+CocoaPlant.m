#import "NSManagedObjectContext+CocoaPlant.h"
#import "NSPersistentStoreCoordinator+CocoaPlant.h"

@implementation NSManagedObjectContext (CocoaPlant)

+ (NSManagedObjectContext *)contextWithStoreType:(NSString *)storeType error:(NSError **)error {
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = [NSPersistentStoreCoordinator
                                          coordinatorWithStoreType:storeType error:error];
    return context;
}

- (void)handleFatalError {
    [[[UIAlertView alloc]
     initWithTitle:NSLocalizedString(@"Error!", nil)
     message:NSLocalizedString(@"Delete the app and download it again from the App Store.", nil)
     delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
}

@end
