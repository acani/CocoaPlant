#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@protocol CPCoreDataTraits <NSObject>

@optional

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
