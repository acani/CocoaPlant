#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Event : NSManagedObject

@property (nonatomic, retain) NSDate *timeStamp;

@end
