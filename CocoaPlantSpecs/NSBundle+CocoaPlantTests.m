#import <SenTestingKit/SenTestingKit.h>
#import "NSBundle+CocoaPlant.h"

@interface NSBundle_CocoaPlantTests : SenTestCase
@end

@implementation NSBundle_CocoaPlantTests

- (void)testName {
    STAssertEqualObjects([[NSBundle mainBundle] name], @"CocoaPlantApp", nil);
}

- (void)testVersion {
    STAssertEqualObjects([[NSBundle mainBundle] version], @"1.0", nil);
}
                           
@end
