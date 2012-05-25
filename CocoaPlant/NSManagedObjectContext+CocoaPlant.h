#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define MOCSave(managedObjectContext) \
{ NSError __autoreleasing *error = nil; \
NSAssert([managedObjectContext save:&error], @"\n\nMOCSave error:\n\n%@", error); }

@interface NSManagedObjectContext (CocoaPlant)

+ (NSManagedObjectContext *)contextWithStoreType:(NSString *)storeType error:(NSError **)error;

- (void)handleFatalError;

@end
