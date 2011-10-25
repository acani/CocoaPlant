#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CPCoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSString *entityName;
@property (strong, nonatomic) NSString *sortKey;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
- (void)handleFatalError;

@end
