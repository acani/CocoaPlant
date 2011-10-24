#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "CPCoreDataTraits.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <CPCoreDataTraits, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
