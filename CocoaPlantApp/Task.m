#import "Task.h"

@implementation Task

@dynamic name;
@dynamic resourceID;

- (BOOL)updateWithDictionary:(NSDictionary *)dictionary {
    NSString *resourceID = [dictionary objectForKey:@"id"];
    NSAssert(!self.resourceID || [self.resourceID isEqualToString:resourceID],
             @"resourceID must stay the same - old: %@ new: %@", self.resourceID, resourceID);
    self.resourceID = resourceID;
    self.name = [dictionary objectForKey:@"name"];
    return YES;
}

@end
