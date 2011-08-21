#import "NSSortDescriptor+CocoaPlant.h"

@implementation NSSortDescriptor (CocoaPlant)

+ (NSArray *)sortDescriptorsWithKey:(NSString *)key ascending:(BOOL)ascending {
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:ascending];
    return [NSArray arrayWithObject:descriptor];
}

@end
