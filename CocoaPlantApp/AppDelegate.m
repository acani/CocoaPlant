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
    managedObjectContext = [NSManagedObjectContext contextWithStoreType:NSSQLiteStoreType
                                                                  error:NULL];
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MasterViewController *masterViewController =
    [[MasterViewController alloc] initWithNibName:nil bundle:nil];
    masterViewController.title = NSLocalizedString(@"Master", nil);
    masterViewController.managedObjectContext = managedObjectContext;
    self.navigationController = [[UINavigationController alloc]
                                 initWithRootViewController:masterViewController];
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    return YES;
}

@end
