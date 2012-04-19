#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define MOCSave(managedObjectContext) \
{ NSError *error = nil; \
NSAssert([managedObjectContext save:&error], @"\n\nMOCSave error in %@\n\n%@", \
NSStringFromSelector(_cmd), error); }

@interface NSManagedObjectContext (CocoaPlant)

+ (NSManagedObjectContext *)contextWithStoreType:(NSString *)storeType error:(NSError **)error;

- (void)handleFatalError;

@end
