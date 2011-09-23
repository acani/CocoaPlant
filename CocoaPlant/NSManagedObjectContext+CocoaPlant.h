#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (CocoaPlant)

+ (NSManagedObjectContext *)contextWithStoreType:(NSString *)storeType error:(NSError **)error;

@end
