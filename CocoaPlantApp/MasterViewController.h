#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <CocoaPlant/CocoaPlant.h>

@class DetailViewController;

@interface MasterViewController : CPCoreDataTableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
