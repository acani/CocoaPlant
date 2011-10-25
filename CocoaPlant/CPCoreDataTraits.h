#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@protocol CPCoreDataTraits <NSFetchedResultsControllerDelegate>

@optional

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
