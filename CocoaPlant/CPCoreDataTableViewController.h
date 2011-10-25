#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <CocoaPlant/CPCoreDataTraits.h>

@interface CPCoreDataTableViewController : UITableViewController <CPCoreDataTraits>

@property (strong, nonatomic) NSString *entityName;
@property (strong, nonatomic) NSString *sortKey;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
- (void)handleFatalError;

@end
