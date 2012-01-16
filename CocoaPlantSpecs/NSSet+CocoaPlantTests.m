#import <SenTestingKit/SenTestingKit.h>
#import "NSSet+CocoaPlant.h"

@interface NSSet_CocoaPlantTests : SenTestCase {
    NSSet *set;
}
@end

@implementation NSSet_CocoaPlantTests

- (void)setUp {
    set = [NSSet set];
}

- (void)tearDown {
    set = nil;
}

//- (void)testDeleteAll {
//    // For some reson the below doesn't work. Issue #73.
//    set = [NSSet setWithObjects:[NSObject mock], [NSObject mock], [NSObject mock], nil];
//    for (NSObject *object in set) {
//        [[object should] receive:@selector(delete)];
//    }
//    [set deleteAll];
//
//    // Oops! This gives the same error.
//    NSObject *object1 = [NSObject mock];
//    [[object1 should] receive:@selector(delete)];
//    NSObject *object2 = [NSObject mock];
//    [[object2 should] receive:@selector(delete)];
//    NSObject *object3 = [NSObject mock];
//    [[object3 should] receive:@selector(delete)];
//    set = [NSSet setWithObjects:object1, object2, object3, nil];
//    [set deleteAll];
//}

@end
