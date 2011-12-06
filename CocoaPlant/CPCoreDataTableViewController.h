#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CPCoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSString *entityName;
@property (strong, nonatomic) NSPredicate *predicate;
@property (strong, nonatomic) NSArray *sortDescriptors;
@property (strong, nonatomic) NSString *cacheName;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
