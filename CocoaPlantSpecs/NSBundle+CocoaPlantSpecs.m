#import <Kiwi/Kiwi.h>

#import "NSBundle+CocoaPlant.h"

SPEC_BEGIN(NSBundle_CocoaPlantSpecs)

describe(@"NSBundle+CocoaPlant", ^{
    it(@"-name", ^{ [[[[NSBundle mainBundle] name] should] equal:@"CocoaPlantApp"]; });
});

SPEC_END
