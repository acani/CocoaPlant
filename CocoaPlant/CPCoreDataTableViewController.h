#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <CocoaPlant/CPCoreDataTraits.h>

@interface CPCoreDataTableViewController : UITableViewController <CPCoreDataTraits>

@property (strong, nonatomic) NSString *entityName;
@property (strong, nonatomic) NSPredicate *predicate;
@property (strong, nonatomic) NSString *sortKey;
@property (nonatomic) BOOL sortAscending;
@property (strong, nonatomic) NSString *cacheName;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
- (void)handleFatalError;

@end
