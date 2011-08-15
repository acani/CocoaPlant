#import <Kiwi/Kiwi.h>

#import "NSArray+CocoaPlant.h"

SPEC_BEGIN(NSArray_CocoaPlantSpecs)

describe(@"NSArray+CocoaPlant", ^{
    describe(@"-firstObject", ^{
        it(@"equals first object", ^{
            id firstObject = @"object";
            NSArray *array = [NSArray arrayWithObject:firstObject];
            [[[array firstObject] should] equal:firstObject];
        });
    });
});

SPEC_END
