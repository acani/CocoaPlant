#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSSortDescriptor (CocoaPlant)

+ (NSArray *)sortDescriptorsWithKey:(NSString *)key ascending:(BOOL)ascending;

@end
