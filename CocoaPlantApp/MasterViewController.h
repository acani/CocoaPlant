#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <CocoaPlant/CocoaPlant.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <CPCoreDataTraits>

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
