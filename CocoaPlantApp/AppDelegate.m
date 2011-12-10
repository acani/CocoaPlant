#import <CocoaPlant/CocoaPlant.h>

#import "AppDelegate.h"
#import "MasterViewController.h"

@implementation AppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize managedObjectContext;

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MasterViewController *controller = [[MasterViewController alloc] init];
    self.navigationController = [[UINavigationController alloc]
                                 initWithRootViewController:controller];
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    return YES;
}

#pragma mark - AppDelegate: Properties

- (NSManagedObjectContext *)managedObjectContext {
    if (managedObjectContext) return managedObjectContext;
    managedObjectContext = [NSManagedObjectContext contextWithStoreType:NSSQLiteStoreType
                                                                  error:NULL];
    return managedObjectContext;
}

@end
