#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSManagedObjectModel (CocoaPlant)

+ (NSManagedObjectModel *)modelWithDefaultURL;
+ (NSURL *)defaultURL;

@end
