#import <Kiwi/Kiwi.h>

#import "CocoaPlant.h"

SPEC_BEGIN(CocoaPlantSpec)

describe(@"CocoaPlant", ^{
    __block CocoaPlant *cocoaPlant;
    
    beforeEach(^{
        cocoaPlant = [[CocoaPlant alloc] init];
    });
    
    describe(@"-test", ^{
        specify(@"fail", ^{
            [[@"cool" should] equal:@"cools"];
        });
    });
});

SPEC_END
