#import "AppDelegate.h"
#import "MasterViewController.h"
#import "NSManagedObjectContext+CocoaPlant.h"

@implementation AppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize managedObjectContext;

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MasterViewController *controller = [[MasterViewController alloc] init];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    return YES;
}

- (NSManagedObjectContext *)managedObjectContext {
    if (managedObjectContext) return managedObjectContext;
    managedObjectContext = [NSManagedObjectContext contextWithStoreType:NSSQLiteStoreType
                                                                  error:NULL];
    return managedObjectContext;
}

//- (void)saveContext
//{
//    NSError *error = nil;
//    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
//    if (managedObjectContext != nil)
//    {
//        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
//        {
//            /*
//             Replace this implementation with code to handle the error appropriately.
//             
//             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
//             */
//            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//            abort();
//        } 
//    }
//}

@end
