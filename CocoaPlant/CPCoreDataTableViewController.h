#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <CocoaPlant/CPCoreDataTraits.h>

@interface CPCoreDataTableViewController : UITableViewController <CPCoreDataTraits> {
    NSFetchedResultsController *fetchedResultsController;
}

@property (strong, nonatomic) NSString *entityName;
@property (strong, nonatomic) NSPredicate *predicate;
@property (strong, nonatomic) NSArray *sortDescriptors;
//@property (strong, nonatomic) NSString *sortKey;
//@property (nonatomic) BOOL sortAscending;
@property (strong, nonatomic) NSString *cacheName;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)handleFatalError;

- (void)refreshTableView;

@end
