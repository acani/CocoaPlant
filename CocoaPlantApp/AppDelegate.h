#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

//- (void)saveContext;

@end
