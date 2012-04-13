#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define MOCSave(managedObjectContext) \
{ NSError *error = nil; \
NSAssert([managedObjectContext save:&error], @"error: %@", error); }

@interface NSManagedObjectContext (CocoaPlant)

+ (NSManagedObjectContext *)contextWithStoreType:(NSString *)storeType error:(NSError **)error;

- (void)handleFatalError;

@end
